//
//  MissionsInteractor.swift
//  SpaceX
//
//  Created by Emil Shpeklord on 06.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

final class MissionsInteractor: MissionsBusinessLogic, MissionsDataStore {
    private let presenter: MissionsPresentationLogic
    private let worker: MissionsWorkerLogic

    init(
        presenter: MissionsPresentationLogic,
        worker: MissionsWorkerLogic
    ) {
        self.presenter = presenter
        self.worker = worker
    }

    func requestInitForm(_ request: Missions.InitForm.Request) {
        DispatchQueue.main.async {
            self.presenter.presentInitForm(Missions.InitForm.Response())
        }
    }
}
