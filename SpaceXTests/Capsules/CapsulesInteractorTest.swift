//
//  CapsulesInteractorTest.swift
//  SpaceXTests
//
//  Created by Emil Shpeklord on 21.04.2022.
//

import XCTest
@testable import SpaceX

class CapsulesInteractorTest: XCTestCase {
    var sut: CapsulesInteractor!
    var presenter: CapsulesPresenterMock!
    var worker: CapsulesWorkerMock!

    override func setUpWithError() throws {
        try super.setUpWithError()

        presenter = CapsulesPresenterMock()
        worker = CapsulesWorkerMock()
        sut = CapsulesInteractor(presenter: presenter, worker: worker)
    }

    override func tearDownWithError() throws {
        sut = nil
        presenter = nil
        worker = nil
        try super.tearDownWithError()
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testWorkerIsCalledSuccess() throws { // worker func name, success or fail and speed test
        sut.getCapsulesData(Capsules.InitForm.Request())
        XCTAssertTrue(worker.getDataIsCalled)
    }
}
