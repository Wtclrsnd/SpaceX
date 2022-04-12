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

    func switchToHistory() {
        let historyVC = HistoryAssembly.build()
        viewController?.navigationController?.pushViewController(historyVC, animated: true)
    }

    func switchToMissions() {
        let missionsVC = MissionsAssembly.build()
        viewController?.navigationController?.pushViewController(missionsVC, animated: true)
    }

    func switchToCapsules() {
        let capsulesVC = CapsulesAssembly.build()
        viewController?.navigationController?.pushViewController(capsulesVC, animated: true)
    }
}

private extension MenuRouter {
}
