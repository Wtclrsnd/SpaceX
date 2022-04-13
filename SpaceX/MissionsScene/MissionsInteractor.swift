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

    private var missions: [Missions.InitForm.Response] = []

    init(
        presenter: MissionsPresentationLogic,
        worker: MissionsWorkerLogic
    ) {
        self.presenter = presenter
        self.worker = worker
    }

    func getMissions(_ request: Missions.InitForm.Request) {
        let urlString = "https://api.spacexdata.com/v3/missions"
        guard let url = URL(string: urlString) else { return }
        let request = URLRequest(url: url)
        self.worker.getMissions(request: request, completion: { missionsData in
            for mission in missionsData {
                self.missions.append(
                    Missions.InitForm.Response(
                        missionName: mission.missionName,
                        missionID: mission.missionID,
                        missionDescription: mission.missionDescription
                    )
                )
            }
            self.presenter.presentInitForm(self.missions)
        })
    }
}
