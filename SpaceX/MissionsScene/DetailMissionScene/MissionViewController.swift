//
//  MissionViewController.swift
//  SpaceX
//
//  Created by Emil Shpeklord on 06.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

final class MissionViewController: UIViewController, MissionDisplayLogic {
    private let interactor: MissionBusinessLogic
    private let router: MissionRoutingLogic

    init(interactor: MissionBusinessLogic, router: MissionRoutingLogic) {
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

    // MARK: - MissionDisplayLogic

    func displayInitForm(_ viewModel: Mission.InitForm.ViewModel) {}

    // MARK: - Private

    private func initForm() {
        interactor.requestInitForm(Mission.InitForm.Request())
    }
}
