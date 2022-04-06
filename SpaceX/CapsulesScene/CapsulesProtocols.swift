//
//  CapsulesProtocols.swift
//  SpaceX
//
//  Created by Emil Shpeklord on 06.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

protocol CapsulesDataPassing {
    var dataStore: CapsulesDataStore { get }
}

protocol CapsulesDataStore {}

protocol CapsulesBusinessLogic {
    func requestInitForm(_ request: Capsules.InitForm.Request)
}

protocol CapsulesWorkerLogic {}

protocol CapsulesPresentationLogic {
    func presentInitForm(_ response: Capsules.InitForm.Response)
}

protocol CapsulesDisplayLogic: AnyObject {
    func displayInitForm(_ viewModel: Capsules.InitForm.ViewModel)
}

protocol CapsulesRoutingLogic {}
