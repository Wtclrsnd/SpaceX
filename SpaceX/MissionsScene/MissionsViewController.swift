//
//  MissionsViewController.swift
//  SpaceX
//
//  Created by Emil Shpeklord on 06.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

final class MissionsViewController: UIViewController, MissionsDisplayLogic {
    private var missions: [Missions.InitForm.ViewModel] = []

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

    private func view() -> MissionsContentView {
        guard let view = self.view as? MissionsContentView else { return MissionsContentView() }
        return view
    }

    override func loadView() {
        self.view = MissionsContentView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        initForm()
        title = "SpaceX Missions"
        view().tableView.delegate = self
        view().tableView.dataSource = self
    }

    // MARK: - MissionsDisplayLogic

    func displayInitForm(_ viewModel: [Missions.InitForm.ViewModel]) {
        missions = viewModel
        view().tableView.reloadData()
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
        cell.selectionStyle = .none
        cell.textLabel?.text = missions[indexPath.row].missionName
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        router.moveToMission(data: missions[indexPath.row])
    }
}
