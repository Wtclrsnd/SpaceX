//
//  MissionsViewController.swift
//  SpaceX
//
//  Created by Emil Shpeklord on 06.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

final class MissionsViewController: UIViewController, MissionsDisplayLogic {
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
    }

    // MARK: - MissionsDisplayLogic

    func displayInitForm(_ viewModel: Missions.InitForm.ViewModel) {}

    // MARK: - Private

    private func initForm() {
        interactor.requestInitForm(Missions.InitForm.Request())
    }
}
