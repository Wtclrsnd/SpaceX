//
//  CapsulesInteractor.swift
//  SpaceX
//
//  Created by Emil Shpeklord on 06.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

final class CapsulesInteractor: CapsulesBusinessLogic, CapsulesDataStore {
    private let presenter: CapsulesPresentationLogic
    private let worker: CapsulesWorkerLogic

    init(
        presenter: CapsulesPresentationLogic,
        worker: CapsulesWorkerLogic
    ) {
        self.presenter = presenter
        self.worker = worker
    }

    func requestInitForm(_ request: Capsules.InitForm.Request) {
        DispatchQueue.main.async {
            self.presenter.presentInitForm(Capsules.InitForm.Response())
        }
    }
}
