//
//  HistoryProtocols.swift
//  SpaceX
//
//  Created by Emil Shpeklord on 06.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol HistoryDataPassing {
    var dataStore: HistoryDataStore { get }
}

protocol HistoryDataStore {}

protocol HistoryBusinessLogic {
    func getData(_ request: History.InitForm.Request)
}

protocol HistoryWorkerLogic {
    func getEvents(request: URLRequest, completion: @escaping ([EventData]) -> Void)
}

protocol HistoryPresentationLogic {
    func presentInitForm(_ response: [History.InitForm.Response])
}

protocol HistoryDisplayLogic: AnyObject {
    func displayInitForm(_ viewModel: [History.InitForm.ViewModel])
}

protocol HistoryRoutingLogic {
    func moveToEvent(data: History.InitForm.ViewModel)
}
