//
//  MissionsWorker.swift
//  SpaceX
//
//  Created by Emil Shpeklord on 06.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

final class MissionsWorker: MissionsWorkerLogic {
	func getMissions(request: URLRequest, completion: @escaping ([MissionData]) -> Void) {
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
					[MissionData].self,
					from: data
				)
//				print(responseObject)
				completion(responseObject)
			} catch let error {
				print(String(describing: error.localizedDescription))
			}
		}
		.resume()
	}
}
