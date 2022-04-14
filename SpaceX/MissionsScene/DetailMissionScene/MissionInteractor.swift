//
//  MissionInteractor.swift
//  SpaceX
//
//  Created by Emil Shpeklord on 06.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

final class MissionInteractor: MissionBusinessLogic, MissionDataStore {
    private let presenter: MissionPresentationLogic

    var missionRaw: Missions.InitForm.ViewModel?

    init(
        presenter: MissionPresentationLogic
    ) {
        self.presenter = presenter
    }

    func requestInitForm(_ request: Mission.InitForm.Request) {
        let mission = Mission.InitForm.Response(
            missionName: missionRaw?.missionName ?? "",
            missionID: missionRaw?.missionID ?? "",
            missionDescription: missionRaw?.missionDescription ?? ""
        )
        DispatchQueue.main.async {
            self.presenter.presentInitForm(mission)
        }
    }
}
