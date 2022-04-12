//
//  EventRouter.swift
//  SpaceX
//
//  Created by Emil Shpeklord on 06.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

final class EventRouter: EventRoutingLogic, EventDataPassing {
    weak var viewController: UIViewController?
    let dataStore: EventDataStore

    init(dataStore: EventDataStore) {
        self.dataStore = dataStore
    }
}

private extension EventRouter {
    //    func passDataTo_() {
    //        source: EventDataStore,
    //        destination: inout SomewhereDataStore
    //    ) {
    //    }
}
