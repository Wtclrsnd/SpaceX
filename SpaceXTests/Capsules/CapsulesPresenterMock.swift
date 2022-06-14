//
//  CapsulesPresenterMock.swift
//  SpaceXTests
//
//  Created by Emil Shpeklord on 21.04.2022.
//

import Foundation
@testable import SpaceX

class CapsulesPresenterMock: CapsulesPresentationLogic {
    var presentInitFormIsCalled: Bool = false // bool

    func presentInitForm(_ response: [Capsules.InitForm.Response]) {
        presentInitFormIsCalled = true
    }
}
