//
//  CapsulesInteractorMock.swift
//  SpaceXTests
//
//  Created by Emil Shpeklord on 22.04.2022.
//

import Foundation
@testable import SpaceX

class CapsulesInteractorMock: CapsulesBusinessLogic {
    var getCapsulesDataIsCalled: Bool = false

    func getCapsulesData(_ request: Capsules.InitForm.Request) {
        getCapsulesDataIsCalled = true
    }
}
