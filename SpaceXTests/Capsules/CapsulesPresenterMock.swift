//
//  CapsulesPresenterMock.swift
//  SpaceXTests
//
//  Created by Emil Shpeklord on 21.04.2022.
//

import Foundation
@testable import SpaceX

class CapsulesPresenterMock: CapsulesPresentationLogic {
    var presentationCount: Int = 0

    func presentInitForm(_ response: [Capsules.InitForm.Response]) {
        presentationCount += 1
    }
}
