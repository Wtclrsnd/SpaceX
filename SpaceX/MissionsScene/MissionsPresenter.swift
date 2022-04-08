//
//  MissionsPresenter.swift
//  SpaceX
//
//  Created by Emil Shpeklord on 06.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

final class MissionsPresenter: MissionsPresentationLogic {
    weak var view: MissionsDisplayLogic?

    func presentInitForm(_ response: [Missions.InitForm.Response]) {
        view?.displayInitForm(response)
    }
}
