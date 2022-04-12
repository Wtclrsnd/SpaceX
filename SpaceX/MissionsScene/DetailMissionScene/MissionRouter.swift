//
//  MissionRouter.swift
//  SpaceX
//
//  Created by Emil Shpeklord on 06.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

final class MissionRouter: MissionRoutingLogic, MissionDataPassing {
    weak var viewController: UIViewController?
    let dataStore: MissionDataStore

    init(dataStore: MissionDataStore) {
        self.dataStore = dataStore
    }
}

private extension MissionRouter {
    //    func passDataTo_() {
    //        source: MissionDataStore,
    //        destination: inout SomewhereDataStore
    //    ) {
    //    }
}
