//
//  MissionAssembly.swift
//  SpaceX
//
//  Created by Emil Shpeklord on 06.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

enum MissionAssembly {
    static func build(data: Missions.InitForm.ViewModel) -> UIViewController {
        let presenter = MissionPresenter()
        let interactor = MissionInteractor(presenter: presenter)
        let viewController = MissionViewController(interactor: interactor)

        presenter.view = viewController

        interactor.missionRaw = data
        viewController.title = data.missionName

        return viewController
    }
}
