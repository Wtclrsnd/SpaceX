//
//  HistoryViewController.swift
//  SpaceX
//
//  Created by Emil Shpeklord on 06.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

final class HistoryViewController: UIViewController, HistoryDisplayLogic {
    private var events: [History.InitForm.ViewModel] = []

    private let interactor: HistoryBusinessLogic
    private let router: HistoryRoutingLogic

    init(interactor: HistoryBusinessLogic, router: HistoryRoutingLogic) {
        self.interactor = interactor
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func view() -> HistoryContentView {
        guard let view = self.view as? HistoryContentView else { return HistoryContentView() }
        return view
    }

    override func loadView() {
        self.view = HistoryContentView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        initForm()
        title = "SpaceX History"

        view().tableView.delegate = self
        view().tableView.dataSource = self
    }

    // MARK: - HistoryDisplayLogic

    func displayInitForm(_ viewModel: [History.InitForm.ViewModel]) {
        events = viewModel
        view().tableView.reloadData()
    }

    // MARK: - Private

    private func initForm() {
        interactor.getData(History.InitForm.Request())
    }
}

extension HistoryViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = events[indexPath.row].title
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        router.moveToEvent(data: events[indexPath.row])
    }
}
