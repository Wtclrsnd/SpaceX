//
//  MissionsWorker.swift
//  SpaceX
//
//  Created by Emil Shpeklord on 06.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

final class MissionsWorker: MissionsWorkerLogic {
    func getMissions(request: URLRequest, completion: @escaping ([Missions.MissionData]) -> Void) {
        URLHelper.shared.fetch(request: request, model: [Missions.MissionData].self) {
            completion($0)
        }
    }
}
