//
//  CapsulesWorker.swift
//  SpaceX
//
//  Created by Emil Shpeklord on 06.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

final class CapsulesWorker: CapsulesWorkerLogic {
    func getData(request: URLRequest, completion: @escaping ([Capsules.CapsuleData]) -> Void) {
        URLHelper.shared.fetch(request: request, model: [Capsules.CapsuleData].self) { result in
            switch result {
            case .success(let capsules):
                completion(capsules)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
