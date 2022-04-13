//
//  CapsulesPresenter.swift
//  SpaceX
//
//  Created by Emil Shpeklord on 06.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

final class CapsulesPresenter: CapsulesPresentationLogic {
    weak var view: CapsulesDisplayLogic?

    var capsules: [Capsules.InitForm.ViewModel] = []

    func presentInitForm(_ response: [Capsules.InitForm.Response]) {
        for caps in response {
            let model = Capsules.InitForm.ViewModel(
                capsuleSerial: caps.capsuleSerial,
                capsuleID: caps.capsuleID,
                status: caps.status,
                originalLaunch: caps.originalLaunch,
                originalLaunchUnix: caps.originalLaunchUnix,
                landings: caps.landings,
                details: caps.details,
                reuseCount: caps.reuseCount
            )
            capsules.append(model)
        }
        view?.displayInitForm(capsules)
    }
}
