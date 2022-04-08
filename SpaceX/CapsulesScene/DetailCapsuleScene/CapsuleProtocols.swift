//
//  CapsuleProtocols.swift
//  SpaceX
//
//  Created by Emil Shpeklord on 06.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

protocol CapsuleDataPassing {
	var dataStore: CapsuleDataStore { get }
}

protocol CapsuleDataStore {}

protocol CapsuleBusinessLogic {
	func requestInitForm(_ request: Capsule.InitForm.Request)
}

protocol CapsuleWorkerLogic {}

protocol CapsulePresentationLogic {
	func presentInitForm(_ response: Capsule.InitForm.Response)
}

protocol CapsuleDisplayLogic: AnyObject {
	func displayInitForm(_ viewModel: Capsule.InitForm.ViewModel)
}

protocol CapsuleRoutingLogic {}
