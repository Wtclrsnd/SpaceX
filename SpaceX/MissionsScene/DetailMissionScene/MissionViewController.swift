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

    init(interactor: MissionBusinessLogic) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func view() -> MissionContentView {
        guard let view = self.view as? MissionContentView else { return MissionContentView() }
        return view
    }

    override func loadView() {
        self.view = MissionContentView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        initForm()
    }

    // MARK: - MissionDisplayLogic

    func displayInitForm(_ viewModel: Mission.InitForm.ViewModel) {
        title = viewModel.missionName
        view().mission = viewModel
    }

    // MARK: - Private

    private func initForm() {
        interactor.requestInitForm(Mission.InitForm.Request())
    }
}
