//
//  CapsulesViewControllerTest.swift
//  SpaceXTests
//
//  Created by Emil Shpeklord on 22.04.2022.
//

import XCTest
@testable import SpaceX

class CapsulesViewControllerTest: XCTestCase {
    var sut: CapsulesViewController!
    var interactor: CapsulesInteractorMock!
    var router: CapsulesRouterMock!

    override func setUpWithError() throws {
        interactor = CapsulesInteractorMock()
        router = CapsulesRouterMock()
        sut = CapsulesViewController(interactor: interactor, router: router)
    }

    override func tearDownWithError() throws {
        sut = nil
        interactor = nil
        router = nil
        try super.tearDownWithError()
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testViewController() throws {
        sut.loadViewIfNeeded()
//        let _ = sut.view
        XCTAssertTrue(interactor.getCapsulesDataIsCalled)
    }
}
