//
//  MenuInteractor.swift
//  SpaceX
//
//  Created by Emil Shpeklord on 06.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

final class MenuInteractor: MenuBusinessLogic, MenuDataStore {
    private let presenter: MenuPresentationLogic
    private let worker: MenuWorkerLogic

    init(
        presenter: MenuPresentationLogic,
        worker: MenuWorkerLogic
    ) {
        self.presenter = presenter
        self.worker = worker
    }

    func requestInitForm(_ request: Menu.InitForm.Request) {
        DispatchQueue.main.async {
            self.presenter.presentInitForm(Menu.InitForm.Response())
        }
    }
}
