//
//  MissionsInteractor.swift
//  SpaceX
//
//  Created by Emil Shpeklord on 06.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

final class MissionsInteractor: MissionsBusinessLogic, MissionsDataStore {
    private let presenter: MissionsPresentationLogic
    private let worker: MissionsWorkerLogic

    init(
        presenter: MissionsPresentationLogic,
        worker: MissionsWorkerLogic
    ) {
        self.presenter = presenter
        self.worker = worker
    }

    func getMissions(_ request: Missions.InitForm.Request) {
//		worker.getMissions(request: URLRequest, completion: @escaping () -> Void)
		let urlString = "https://api.spacexdata.com/v3/missions"
		guard let url = URL(string: urlString) else { return }
		let request = URLRequest(url: url)
        DispatchQueue.main.async {
			self.worker.getMissions(request: request, completion: { _ in
			})
            self.presenter.presentInitForm(Missions.InitForm.Response())
        }
    }
}
