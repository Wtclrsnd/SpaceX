//
//  EventAssembly.swift
//  SpaceX
//
//  Created by Emil Shpeklord on 06.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

enum EventAssembly {
    static func build() -> UIViewController {
        let presenter = EventPresenter()
        let worker = EventWorker()
        let interactor = EventInteractor(presenter: presenter, worker: worker)
        let router = EventRouter(dataStore: interactor)
        let viewController = EventViewController(interactor: interactor, router: router)

        presenter.view = viewController
        router.viewController = viewController

        return viewController
    }
}
