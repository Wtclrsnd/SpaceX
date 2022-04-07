//
//  MissionsRouter.swift
//  SpaceX
//
//  Created by Emil Shpeklord on 06.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

final class MissionsRouter: MissionsRoutingLogic, MissionsDataPassing {
    weak var viewController: UIViewController?
    let dataStore: MissionsDataStore

    init(dataStore: MissionsDataStore) {
        self.dataStore = dataStore
    }

	func moveToMission(data: Missions.InitForm.Response) {
		let detailVC = MissionAssembly.build(data: data)
		viewController?.navigationController?.pushViewController(detailVC, animated: true)
	}
}

private extension MissionsRouter {
//    func passDataTo_() {
//        source: MissionsDataStore,
//        destination: inout SomewhereDataStore
//    ) {
//    }
}
