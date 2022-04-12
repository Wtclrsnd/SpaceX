//
//  CapsuleRouter.swift
//  SpaceX
//
//  Created by Emil Shpeklord on 06.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

final class CapsuleRouter: CapsuleRoutingLogic, CapsuleDataPassing {
    weak var viewController: UIViewController?
    let dataStore: CapsuleDataStore

    init(dataStore: CapsuleDataStore) {
        self.dataStore = dataStore
    }
}

private extension CapsuleRouter {
    //    func passDataTo_() {
    //        source: CapsuleDataStore,
    //        destination: inout SomewhereDataStore
    //    ) {
    //    }
}
