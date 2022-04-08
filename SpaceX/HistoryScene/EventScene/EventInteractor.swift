//
//  EventInteractor.swift
//  SpaceX
//
//  Created by Emil Shpeklord on 06.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

final class EventInteractor: EventBusinessLogic, EventDataStore {
	private let presenter: EventPresentationLogic
	private let worker: EventWorkerLogic

	init(
		presenter: EventPresentationLogic,
		worker: EventWorkerLogic
	) {
		self.presenter = presenter
		self.worker = worker
	}

	func requestInitForm(_ request: Event.InitForm.Request) {
		DispatchQueue.main.async {
			self.presenter.presentInitForm(Event.InitForm.Response())
		}
	}
}
