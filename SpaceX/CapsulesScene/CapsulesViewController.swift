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
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = capsules[indexPath.row].capsuleSerial
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        router.moveToCapsule(data: capsules[indexPath.row])
    }
}
