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
        do {
            try URLHelper.shared.fetch(request: request, model: [History.EventData].self) {
                completion($0)
            }
        } catch HelperError.incorrectJson {
            print(HelperError.incorrectJson.localizedDescription)
        } catch {
            print("Other Error")
        }
    }
}
