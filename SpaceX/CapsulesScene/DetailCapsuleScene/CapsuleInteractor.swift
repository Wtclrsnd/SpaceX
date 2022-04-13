//
//  CapsuleInteractor.swift
//  SpaceX
//
//  Created by Emil Shpeklord on 06.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

final class CapsuleInteractor: CapsuleBusinessLogic, CapsuleDataStore {
    private let presenter: CapsulePresentationLogic

    var capsuleRaw: Capsules.InitForm.ViewModel?

    init(
        presenter: CapsulePresentationLogic
    ) {
        self.presenter = presenter
    }

    func requestInitForm(_ request: Capsule.InitForm.Request) {
        guard let capsuleRaw = capsuleRaw else { return }
        let capsule = Capsule.InitForm.Response(
            capsuleSerial: capsuleRaw.capsuleSerial,
            capsuleID: capsuleRaw.capsuleID,
            status: capsuleRaw.status,
            originalLaunch: capsuleRaw.originalLaunch,
            originalLaunchUnix: capsuleRaw.originalLaunchUnix,
            landings: capsuleRaw.landings,
            details: capsuleRaw.details,
            reuseCount: capsuleRaw.reuseCount
        )
        DispatchQueue.main.async {
            self.presenter.presentInitForm(capsule)
        }
    }
}
