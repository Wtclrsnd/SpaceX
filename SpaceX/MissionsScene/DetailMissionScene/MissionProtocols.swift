//
//  MissionProtocols.swift
//  SpaceX
//
//  Created by Emil Shpeklord on 06.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

protocol MissionDataPassing {
    var dataStore: MissionDataStore { get }
}

protocol MissionDataStore {}

protocol MissionBusinessLogic {
    func requestInitForm(_ request: Mission.InitForm.Request)
}

protocol MissionPresentationLogic {
    func presentInitForm(_ response: Mission.InitForm.Response)
}

protocol MissionDisplayLogic: AnyObject {
    func displayInitForm(_ viewModel: Mission.InitForm.ViewModel)
}

protocol MissionViewToVCDelegate: AnyObject {
    func passData(viewModel: Mission.InitForm.ViewModel)
}
