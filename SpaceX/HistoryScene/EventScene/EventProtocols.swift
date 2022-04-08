//
//  EventProtocols.swift
//  SpaceX
//
//  Created by Emil Shpeklord on 06.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

protocol EventDataPassing {
	var dataStore: EventDataStore { get }
}

protocol EventDataStore {}

protocol EventBusinessLogic {
	func requestInitForm(_ request: Event.InitForm.Request)
}

protocol EventWorkerLogic {}

protocol EventPresentationLogic {
	func presentInitForm(_ response: Event.InitForm.Response)
}

protocol EventDisplayLogic: AnyObject {
	func displayInitForm(_ viewModel: Event.InitForm.ViewModel)
}

protocol EventRoutingLogic {}
