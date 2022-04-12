//
//  MenuViewController.swift
//  SpaceX
//
//  Created by Emil Shpeklord on 06.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

final class MenuViewController: UIViewController, MenuDisplayLogic {
	private lazy var tableView: UITableView = {
		let tableView = UITableView()
		tableView.isScrollEnabled = false
		tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
		return tableView
	}()

	private let menuRows = ["History", "Missions", "Capsules"]

	private let interactor: MenuBusinessLogic
	private let router: MenuRoutingLogic

	init(interactor: MenuBusinessLogic, router: MenuRoutingLogic) {
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

	func setUpUI() {
		navigationController?.navigationBar.prefersLargeTitles = true
		title = "SpaceX"
		navigationController?.navigationBar.tintColor = .systemPink

		view.addSubview(tableView)
		tableView.frame = view.bounds
	}

    // MARK: - MenuDisplayLogic

    func displayInitForm(_ viewModel: Menu.InitForm.ViewModel) {}

    // MARK: - Private

    private func initForm() {
        interactor.requestInitForm(Menu.InitForm.Request())
    }
}

extension MenuViewController: UITableViewDelegate, UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return menuRows.count
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
		cell.textLabel?.text = menuRows[indexPath.row]
		return cell
	}

	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		switch indexPath.row {
		case 0:
			router.switchToHistory()
		case 1:
			router.switchToMissions()
		case 2:
			router.switchToCapsules()
		default:
			()
		}
	}
}
