//
//  CapsulesRouterMock.swift
//  SpaceXTests
//
//  Created by Emil Shpeklord on 22.04.2022.
//

import Foundation
@testable import SpaceX

class CapsulesRouterMock: CapsulesRoutingLogic {
    var moveToCapsuleIsCalled: Bool = false

    func moveToCapsule(data: Capsules.InitForm.ViewModel) {
        moveToCapsuleIsCalled = true
    }
}
