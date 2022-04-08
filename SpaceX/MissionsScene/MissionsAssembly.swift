//
//  MissionsAssembly.swift
//  SpaceX
//
//  Created by Emil Shpeklord on 06.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

enum MissionsAssembly {
	static func build() -> UIViewController {
		let presenter = MissionsPresenter()
		let worker = MissionsWorker()
		let interactor = MissionsInteractor(presenter: presenter, worker: worker)
		let router = MissionsRouter(dataStore: interactor)
		let viewController = MissionsViewController(interactor: interactor, router: router)

		presenter.view = viewController
		router.viewController = viewController

		return viewController
	}
}
