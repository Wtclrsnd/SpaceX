//
//  MenuProtocols.swift
//  SpaceX
//
//  Created by Emil Shpeklord on 06.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

protocol MenuDataPassing {
    var dataStore: MenuDataStore { get }
}

protocol MenuDataStore {}

protocol MenuBusinessLogic {
    func requestInitForm(_ request: Menu.InitForm.Request)
}

protocol MenuWorkerLogic {}

protocol MenuPresentationLogic {
    func presentInitForm(_ response: Menu.InitForm.Response)
}

protocol MenuDisplayLogic: AnyObject {
    func displayInitForm(_ viewModel: Menu.InitForm.ViewModel)
}

protocol MenuRoutingLogic {
	func switchToHistory()
	func switchToMissions()
	func switchToCapsules()
}
