//
//  CapsulesViewController.swift
//  SpaceX
//
//  Created by Emil Shpeklord on 06.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

final class CapsulesViewController: UIViewController, CapsulesDisplayLogic {
//    private var capsules: [Capsules.InitForm.ViewModel] = []

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
    }
    // MARK: - CapsulesDisplayLogic

    func displayInitForm(_ viewModel: [Capsules.InitForm.ViewModel]) {
        view().capsules = viewModel
    }

    // MARK: - Private

    private func initForm() {
        interactor.getCapsulesData(Capsules.InitForm.Request())
    }
}
