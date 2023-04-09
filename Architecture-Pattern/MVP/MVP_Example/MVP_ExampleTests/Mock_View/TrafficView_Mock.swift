//
//  TrafficView_Mock.swift
//  MVP_ExampleTests
//
//  Created by SHIN YOON AH on 2023/04/09.
//

@testable import MVP_Example

final class TrafficView_Mock: TrafficLightViewDelegate {

    // MARK: - property

    var displayText: String?

    // MARK: - func

    func displayTrafficLight(description: String) {
        self.displayText = description
    }
}
