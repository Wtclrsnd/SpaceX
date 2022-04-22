//
//  CapsulesWorkerMock.swift
//  SpaceXTests
//
//  Created by Emil Shpeklord on 21.04.2022.
//

import Foundation
@testable import SpaceX

class CapsulesWorkerMock: CapsulesWorkerLogic {
    var requestCount: Int = 0

    func getData(request: URLRequest, completion: @escaping ([Capsules.CapsuleData]) -> Void) {
        requestCount += 1
    }
}
