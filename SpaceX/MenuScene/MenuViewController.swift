//
//  MenuViewController.swift
//  SpaceX
//
//  Created by Emil Shpeklord on 06.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

final class MenuViewController: UIViewController, MenuDisplayLogic {
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
    }

    // MARK: - MenuDisplayLogic

    func displayInitForm(_ viewModel: Menu.InitForm.ViewModel) {}

    // MARK: - Private

    private func initForm() {
        interactor.requestInitForm(Menu.InitForm.Request())
    }
}
