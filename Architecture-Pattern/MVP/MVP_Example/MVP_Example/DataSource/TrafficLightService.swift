//
//  TrafficLightService.swift
//  MVP_Example
//
//  Created by SHIN YOON AH on 2023/04/09.
//

import Foundation

///
/// 데이터 제공자(data provider) 역할을 할 서비스 클래스
///

enum TrafficError: Error, LocalizedError {
    case invalidTraffic

    var errorDescription: String {
        switch self {
        case .invalidTraffic: return "input wrong traffic color"
        }
    }
}

final class TrafficLightService {
    func trafficLight(colorName: String, completion: @escaping (Result<TrafficLight, TrafficError>) -> Void) {
        let trafficLights = [
            TrafficLight(colorName: "Red", description: "Stop"),
            TrafficLight(colorName: "Green", description: "Go"),
            TrafficLight(colorName: "Yellow", description: "About to change to red")
        ]

        if let targetTrafficLight = trafficLights.first(where: { $0.colorName == colorName }) {
            completion(.success(targetTrafficLight))
        }

        completion(.failure(.invalidTraffic))
    }
}
