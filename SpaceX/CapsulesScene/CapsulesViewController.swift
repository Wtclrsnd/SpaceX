//
//  CapsulesViewController.swift
//  SpaceX
//
//  Created by Emil Shpeklord on 06.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

final class CapsulesViewController: UIViewController, CapsulesDisplayLogic {
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

    override func viewDidLoad() {
        super.viewDidLoad()
        initForm()
    }

    // MARK: - CapsulesDisplayLogic

    func displayInitForm(_ viewModel: Capsules.InitForm.ViewModel) {}

    // MARK: - Private

    private func initForm() {
        interactor.requestInitForm(Capsules.InitForm.Request())
    }
}
