//
//  CapsulesAssembly.swift
//  SpaceX
//
//  Created by Emil Shpeklord on 06.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

enum CapsulesAssembly {
	static func build() -> UIViewController {
		let presenter = CapsulesPresenter()
		let worker = CapsulesWorker()
		let interactor = CapsulesInteractor(presenter: presenter, worker: worker)
		let router = CapsulesRouter(dataStore: interactor)
		let viewController = CapsulesViewController(interactor: interactor, router: router)

		presenter.view = viewController
		router.viewController = viewController

		return viewController
	}
}
