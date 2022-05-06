//
//  HistoryWorker.swift
//  SpaceX
//
//  Created by Emil Shpeklord on 06.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

final class HistoryWorker: HistoryWorkerLogic {
    func getEvents(request: URLRequest, completion: @escaping ([History.EventData]) -> Void) {
        URLHelper.shared.fetch(request: request, model: [History.EventData].self) { result in
            switch result {
            case .success(let events):
                completion(events)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
