//
//  CapsulesRouter.swift
//  SpaceX
//
//  Created by Emil Shpeklord on 06.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

final class CapsulesRouter: CapsulesRoutingLogic, CapsulesDataPassing {
    weak var viewController: UIViewController?
    let dataStore: CapsulesDataStore

    func moveToCapsule(data: Capsules.InitForm.ViewModel) {
        let detailVC = CapsuleAssembly.build(data: data)
        viewController?.navigationController?.pushViewController(detailVC, animated: true)
    }

    init(dataStore: CapsulesDataStore) {
        self.dataStore = dataStore
    }
}

private extension CapsulesRouter {
    //    func passDataTo_() {
    //        source: CapsulesDataStore,
    //        destination: inout SomewhereDataStore
    //    ) {
    //    }
}
