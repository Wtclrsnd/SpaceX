//
//  MissionsProtocols.swift
//  SpaceX
//
//  Created by Emil Shpeklord on 06.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol MissionsDataPassing {
    var dataStore: MissionsDataStore { get }
}

protocol MissionsDataStore {}

protocol MissionsBusinessLogic {
    func getMissions(_ request: Missions.InitForm.Request)
}

protocol MissionsWorkerLogic {
    func getMissions(request: URLRequest, completion: @escaping ([MissionData]) -> Void)
}

protocol MissionsPresentationLogic {
    func presentInitForm(_ response: [Missions.InitForm.Response])
}

protocol MissionsDisplayLogic: AnyObject {
    func displayInitForm(_ data: [Missions.InitForm.Response])
}

protocol MissionsRoutingLogic {
    func moveToMission(data: Missions.InitForm.Response)
}
