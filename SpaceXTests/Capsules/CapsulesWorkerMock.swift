//
//  CapsulesWorkerMock.swift
//  SpaceXTests
//
//  Created by Emil Shpeklord on 21.04.2022.
//

import Foundation
@testable import SpaceX

class CapsulesWorkerMock: CapsulesWorkerLogic {
    var getDataIsCalled: Bool = false

    func getData(request: URLRequest, completion: @escaping ([Capsules.CapsuleData]) -> Void) {
        getDataIsCalled = true
    }
}
