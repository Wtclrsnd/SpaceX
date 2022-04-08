//
//  MissionInteractor.swift
//  SpaceX
//
//  Created by Emil Shpeklord on 06.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

final class MissionInteractor: MissionBusinessLogic, MissionDataStore {
	private let presenter: MissionPresentationLogic
	private let worker: MissionWorkerLogic

	init(
		presenter: MissionPresentationLogic,
		worker: MissionWorkerLogic
	) {
		self.presenter = presenter
		self.worker = worker
	}

	func requestInitForm(_ request: Mission.InitForm.Request) {
		DispatchQueue.main.async {
			self.presenter.presentInitForm(Mission.InitForm.Response())
		}
	}
}
