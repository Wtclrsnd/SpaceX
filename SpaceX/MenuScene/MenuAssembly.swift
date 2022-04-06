//
//  MenuAssembly.swift
//  SpaceX
//
//  Created by Emil Shpeklord on 06.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

enum MenuAssembly {
    static func build() -> UIViewController {
        let presenter = MenuPresenter()
        let worker = MenuWorker()
        let interactor = MenuInteractor(presenter: presenter, worker: worker)
        let router = MenuRouter(dataStore: interactor)
        let viewController = MenuViewController(interactor: interactor, router: router)

        presenter.view = viewController
        router.viewController = viewController

        return viewController
    }
}
