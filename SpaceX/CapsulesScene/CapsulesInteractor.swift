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

    func getCapsulesData(_ request: Capsules.InitForm.Request) {
		let urlString = "https://api.spacexdata.com/v3/capsules"
		guard let url = URL(string: urlString) else { return }
		let request = URLRequest(url: url)
		worker.getData(request: request, completion: { capsules in

		})
        DispatchQueue.main.async {
            self.presenter.presentInitForm(Capsules.InitForm.Response())
        }
    }
}
