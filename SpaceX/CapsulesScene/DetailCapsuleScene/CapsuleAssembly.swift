//
//  CapsuleAssembly.swift
//  SpaceX
//
//  Created by Emil Shpeklord on 06.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

enum CapsuleAssembly {
    static func build() -> UIViewController {
        let presenter = CapsulePresenter()
        let worker = CapsuleWorker()
        let interactor = CapsuleInteractor(presenter: presenter, worker: worker)
        let router = CapsuleRouter(dataStore: interactor)
        let viewController = CapsuleViewController(interactor: interactor, router: router)

        presenter.view = viewController
        router.viewController = viewController

        return viewController
    }
}
