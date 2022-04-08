//
//  HistoryWorker.swift
//  SpaceX
//
//  Created by Emil Shpeklord on 06.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

final class HistoryWorker: HistoryWorkerLogic {
	func getEvents(request: URLRequest, completion: @escaping ([EventData]) -> Void) {
		URLSession.shared.dataTask(with: request) { data, _, error in
			guard error == nil else {
				print(String(describing: error?.localizedDescription))
				return
			}
			guard let data = data else {
				return
			}

			let jsonDecoder = JSONDecoder()

			do {
				let responseObject = try jsonDecoder.decode(
					[EventData].self,
					from: data
				)
				print(responseObject)
				completion(responseObject)
			} catch let error {
				print(String(describing: error.localizedDescription))
			}
		}
		.resume()
	}
}
