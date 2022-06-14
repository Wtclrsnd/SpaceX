//
//  SpaceXSlowTests.swift
//  SpaceXSlowTests
//
//  Created by Emil Shpeklord on 22.04.2022.
//

import XCTest
@testable import SpaceX

class SpaceXSlowTests: XCTestCase {
    var sut: CapsulesWorker!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CapsulesWorker()
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }

    func testWorkerGetsJSONSucsess() throws {
        // given
        let url = loadStub(name: "FakeCorrectJson", withExtension: "json")
        guard let url = url else { return }
        let request = URLRequest(url: url)
        var array: [Capsules.CapsuleData] = []

        // when
        measure(
            metrics: [
                XCTClockMetric(),
                XCTCPUMetric()
            ]
        ) {
            sut.getData(request: request, completion: {
                array = $0
            })
        }

        // then
        XCTAssertFalse(array.isEmpty, "array is empty")
    }

    func testWorkerGetsBadJSONFail() throws {
        let url = loadStub(name: "FakeBadJson", withExtension: "json")
        guard let url = url else { return }
        let request = URLRequest(url: url)
        let workerCompletionTriggers = expectation(description: "data")
        var array: [Capsules.CapsuleData] = []

        // when
        measure {
            sut.getData(request: request, completion: {
                array = $0
                workerCompletionTriggers.fulfill()
            })
        }

        // then
        waitForExpectations(timeout: 3, handler: nil)
        XCTAssertFalse(array.isEmpty, "array is empty")
    }

    // test with string append vs +
}

extension XCTestCase {
    func loadStub(name: String, withExtension: String) -> URL? {
        let bundle = Bundle(for: type(of: self))
        let url = bundle.url(forResource: name, withExtension: withExtension)
        return url
    }
}
