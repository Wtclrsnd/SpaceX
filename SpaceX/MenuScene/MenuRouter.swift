//
//  MenuRouter.swift
//  SpaceX
//
//  Created by Emil Shpeklord on 06.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

final class MenuRouter: MenuRoutingLogic, MenuDataPassing {
    weak var viewController: UIViewController?
    let dataStore: MenuDataStore

    init(dataStore: MenuDataStore) {
        self.dataStore = dataStore
    }
}

private extension MenuRouter {
//    func passDataTo_() {
//        source: MenuDataStore,
//        destination: inout SomewhereDataStore
//    ) {
//    }
}
