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
    private let worker: CapsuleWorkerLogic

    init(
        presenter: CapsulePresentationLogic,
        worker: CapsuleWorkerLogic
    ) {
        self.presenter = presenter
        self.worker = worker
    }

    func requestInitForm(_ request: Capsule.InitForm.Request) {
        DispatchQueue.main.async {
            self.presenter.presentInitForm(Capsule.InitForm.Response())
        }
    }
}
