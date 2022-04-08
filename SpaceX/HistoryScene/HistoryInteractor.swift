//
//  HistoryInteractor.swift
//  SpaceX
//
//  Created by Emil Shpeklord on 06.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

final class HistoryInteractor: HistoryBusinessLogic, HistoryDataStore {
	private var events: [History.InitForm.Response] = []

	private let presenter: HistoryPresentationLogic
	private let worker: HistoryWorkerLogic

	init(
		presenter: HistoryPresentationLogic,
		worker: HistoryWorkerLogic
	) {
		self.presenter = presenter
		self.worker = worker
	}

	func getData(_ request: History.InitForm.Request) {
		let urlString = "https://api.spacexdata.com/v3/history"
		guard let url = URL(string: urlString) else { return }
		let request = URLRequest(url: url)
		DispatchQueue.main.async {
			self.worker.getEvents(request: request, completion: { eventsData in
				for event in eventsData {
					self.events.append(
						History.InitForm.Response(
							title: event.title,
							eventDateUTC: event.eventDateUTC,
							details: event.details
						)
					)
				}
				self.presenter.presentInitForm(self.events)
			})
		}
	}
}
