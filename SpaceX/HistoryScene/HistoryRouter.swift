//
//  HistoryRouter.swift
//  SpaceX
//
//  Created by Emil Shpeklord on 06.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

final class HistoryRouter: HistoryRoutingLogic, HistoryDataPassing {
    weak var viewController: UIViewController?
    let dataStore: HistoryDataStore

    init(dataStore: HistoryDataStore) {
        self.dataStore = dataStore
    }

    func moveToEvent(data: History.InitForm.ViewModel) {
        let detailVC = EventAssembly.build(data: data)
        viewController?.navigationController?.pushViewController(detailVC, animated: true)
    }
}

private extension HistoryRouter {
    //    func passDataTo_() {
    //        source: HistoryDataStore,
    //        destination: inout SomewhereDataStore
    //    ) {
    //    }
}
