//
//  CapsulesViewController.swift
//  SpaceX
//
//  Created by Emil Shpeklord on 06.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

final class CapsulesViewController: UIViewController, CapsulesDisplayLogic {
    private var capsules: [Capsules.InitForm.ViewModel] = []

    private let interactor: CapsulesBusinessLogic
    private let router: CapsulesRoutingLogic

    init(interactor: CapsulesBusinessLogic, router: CapsulesRoutingLogic) {
        self.interactor = interactor
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func view() -> CapsulesContentView {
        guard let view = self.view as? CapsulesContentView else { return CapsulesContentView() }
        return view
    }

    override func loadView() {
        self.view = CapsulesContentView()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        initForm()
        title = "SpaceX Capsules"

        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .lightText
        appearance.titleTextAttributes = [.foregroundColor: UIColor.lightText]
//        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.lightText]

        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance

        view().tableView.delegate = self
        view().tableView.dataSource = self
    }
    // MARK: - CapsulesDisplayLogic

    func displayInitForm(_ viewModel: [Capsules.InitForm.ViewModel]) {
        capsules = viewModel
        view().tableView.reloadData()
    }

    // MARK: - Private

    private func initForm() {
        interactor.getCapsulesData(Capsules.InitForm.Request())
    }
}

extension CapsulesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return capsules.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: "myCell",
            for: indexPath
        ) as? CapsulesTableViewCell else { return UITableViewCell() }

        cell.selectionStyle = .none
        cell.capsuleSerial.text = capsules[indexPath.row].capsuleSerial
        cell.capsuleDetails.text = capsules[indexPath.row].details

        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ru_RU")
        dateFormatter.dateFormat = "dd.MM.yyyy"
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        let string = capsules[indexPath.row].originalLaunch ?? "0"
        let date = dateFormatter.date(from: string)
        cell.capsuleDate.text = dateFormatter.string(from: date ?? Date())

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        router.moveToCapsule(data: capsules[indexPath.row])
    }
}
