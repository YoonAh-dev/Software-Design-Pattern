//
//  MVP_ExampleTests.swift
//  MVP_ExampleTests
//
//  Created by SHIN YOON AH on 2023/04/09.
//

import XCTest
@testable import MVP_Example

final class MVP_ExampleTests: XCTestCase {

    var mockView: TrafficView_Mock?
    var sut: TrafficLightPresenter?

    override func setUpWithError() throws {
        self.mockView = TrafficView_Mock()
        self.sut = TrafficLightPresenter(trafficLightService: TrafficLightService())
        self.sut?.setViewDelegate(trafficLightViewDelegate: self.mockView)
    }

    override func tearDownWithError() throws {
        self.sut = nil
    }

    func testExample() throws { }

    func testPerformanceExample() throws {
        self.measure { }
    }

    func test_presenter_빨간색을_넣었을때_올바른_description_출력하는가() {
        self.sut?.trafficLightColorSelected(colorName: "Red")
        XCTAssertEqual("Stop", self.mockView?.displayText)
    }
}
