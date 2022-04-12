//
//  HistoryViewController.swift
//  SpaceX
//
//  Created by Emil Shpeklord on 06.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

final class HistoryViewController: UIViewController, HistoryDisplayLogic {
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()

    private var events: [History.InitForm.Response] = []

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
        title = "SpaceX History"

        view.addSubview(tableView)
        tableView.frame = view.bounds
    }

    // MARK: - HistoryDisplayLogic

    func displayInitForm(_ data: [History.InitForm.Response]) {
        events = data
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
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
