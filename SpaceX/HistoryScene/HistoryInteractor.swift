//
//  HistoryInteractor.swift
//  SpaceX
//
//  Created by Emil Shpeklord on 06.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

final class HistoryInteractor: HistoryBusinessLogic, HistoryDataStore {
    private let presenter: HistoryPresentationLogic
    private let worker: HistoryWorkerLogic

    init(
        presenter: HistoryPresentationLogic,
        worker: HistoryWorkerLogic
    ) {
        self.presenter = presenter
        self.worker = worker
    }

    func requestInitForm(_ request: History.InitForm.Request) {
        DispatchQueue.main.async {
            self.presenter.presentInitForm(History.InitForm.Response())
        }
    }
}
