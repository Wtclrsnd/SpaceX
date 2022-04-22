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

    func testInteractor() throws {
        sut.getCapsulesData(Capsules.InitForm.Request())
        XCTAssertEqual(worker.requestCount, 1)
    }

    func testWorkerGettingData() throws {
        let urlString = "https://api.spacexdata.com/v3/capsules"
        guard let url = URL(string: urlString) else { return }
        let request = URLRequest(url: url)
        worker.getData(request: request, completion: { _ in })
        XCTAssertEqual(worker.requestCount, 1)
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete.
        // Check the results with assertions afterwards.
    }

    func testModuleIsNotNil() throws {
        XCTAssertNotNil(sut, "interactor is not nil")
        XCTAssertNotNil(presenter, "presenter is not nil")
        XCTAssertNotNil(worker, "worker is not nil")
    }
}
