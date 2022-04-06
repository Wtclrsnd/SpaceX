//
//  MissionsProtocols.swift
//  SpaceX
//
//  Created by Emil Shpeklord on 06.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

protocol MissionsDataPassing {
    var dataStore: MissionsDataStore { get }
}

protocol MissionsDataStore {}

protocol MissionsBusinessLogic {
    func requestInitForm(_ request: Missions.InitForm.Request)
}

protocol MissionsWorkerLogic {}

protocol MissionsPresentationLogic {
    func presentInitForm(_ response: Missions.InitForm.Response)
}

protocol MissionsDisplayLogic: AnyObject {
    func displayInitForm(_ viewModel: Missions.InitForm.ViewModel)
}

protocol MissionsRoutingLogic {}
