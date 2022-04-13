//
//  CapsulesProtocols.swift
//  SpaceX
//
//  Created by Emil Shpeklord on 06.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

protocol CapsulesDataPassing {
    var dataStore: CapsulesDataStore { get }
}

protocol CapsulesDataStore {}

protocol CapsulesBusinessLogic {
    func getCapsulesData(_ request: Capsules.InitForm.Request)
}

protocol CapsulesWorkerLogic {
    func getData(request: URLRequest, completion: @escaping ([Capsules.CapsuleData]) -> Void)
}

protocol CapsulesPresentationLogic {
    func presentInitForm(_ response: [Capsules.InitForm.Response])
}

protocol CapsulesDisplayLogic: AnyObject {
    func displayInitForm(_ data: [Capsules.InitForm.Response]) //viewModel
}

protocol CapsulesRoutingLogic {
    func moveToCapsule(data: Capsules.InitForm.Response)
}
