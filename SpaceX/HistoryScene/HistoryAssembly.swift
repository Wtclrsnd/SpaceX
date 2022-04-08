//
//  HistoryAssembly.swift
//  SpaceX
//
//  Created by Emil Shpeklord on 06.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

enum HistoryAssembly {
	static func build() -> UIViewController {
		let presenter = HistoryPresenter()
		let worker = HistoryWorker()
		let interactor = HistoryInteractor(presenter: presenter, worker: worker)
		let router = HistoryRouter(dataStore: interactor)
		let viewController = HistoryViewController(interactor: interactor, router: router)

		presenter.view = viewController
		router.viewController = viewController

		return viewController
	}
}
