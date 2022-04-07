//
//  MissionsViewController.swift
//  SpaceX
//
//  Created by Emil Shpeklord on 06.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

final class MissionsViewController: UIViewController, MissionsDisplayLogic {
	private lazy var tableView: UITableView = {
		let tableView = UITableView()
		tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
		return tableView
	}()

	var missions: [Missions.InitForm.Response] = []

    private let interactor: MissionsBusinessLogic
    private let router: MissionsRoutingLogic

    init(interactor: MissionsBusinessLogic, router: MissionsRoutingLogic) {
        self.interactor = interactor
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        initForm()
		setUpUI()
		tableView.delegate = self
		tableView.dataSource = self
		tableView.reloadData()
    }

	private func setUpUI() {
		view.backgroundColor = .systemBackground
		title = "SpaceX Missions"

		view.addSubview(tableView)
		tableView.frame = view.bounds
	}

    // MARK: - MissionsDisplayLogic

	func displayInitForm(_ data: [Missions.InitForm.Response]) {
		missions = data
		DispatchQueue.main.async {
			self.tableView.reloadData()
		}
	}

    // MARK: - Private

    private func initForm() {
        interactor.getMissions(Missions.InitForm.Request())
    }
}

extension MissionsViewController: UITableViewDelegate, UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return missions.count
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
		cell.textLabel?.text = missions[indexPath.row].missionName
		return cell
	}

	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		router.moveToMission(data: missions[indexPath.row])
	}
}
