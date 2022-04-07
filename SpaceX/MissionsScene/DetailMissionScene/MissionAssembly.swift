//
//  MissionAssembly.swift
//  SpaceX
//
//  Created by Emil Shpeklord on 06.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

enum MissionAssembly {
    static func build() -> UIViewController {
        let presenter = MissionPresenter()
        let worker = MissionWorker()
        let interactor = MissionInteractor(presenter: presenter, worker: worker)
        let router = MissionRouter(dataStore: interactor)
        let viewController = MissionViewController(interactor: interactor, router: router)

        presenter.view = viewController
        router.viewController = viewController

        return viewController
    }
}
