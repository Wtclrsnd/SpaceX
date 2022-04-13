//
//  CapsulePresenter.swift
//  SpaceX
//
//  Created by Emil Shpeklord on 06.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

final class CapsulePresenter: CapsulePresentationLogic {
    weak var view: CapsuleDisplayLogic?

    func presentInitForm(_ response: Capsule.InitForm.Response) {
        let viewModel = Capsule.InitForm.ViewModel(
            capsuleSerial: response.capsuleSerial,
            capsuleID: response.capsuleID,
            status: response.status,
            originalLaunch: response.originalLaunch,
            originalLaunchUnix: response.originalLaunchUnix,
            landings: response.landings,
            details: response.details,
            reuseCount: response.reuseCount
        )
        view?.displayInitForm(viewModel)
    }
}
