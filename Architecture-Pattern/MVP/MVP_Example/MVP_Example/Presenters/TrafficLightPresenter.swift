//
//  TrafficLightPresenter.swift
//  MVP_Example
//
//  Created by SHIN YOON AH on 2023/04/09.
//

import Foundation

protocol TrafficLightPresenterProtocol: AnyObject {
    func trafficLightColorSelected(colorName: String)
}

final class TrafficLightPresenter: TrafficLightPresenterProtocol {

    // MARK: - property

    private let trafficLightService: TrafficLightService
    weak private var trafficLightViewDelegate: TrafficLightViewDelegate?

    // MARK: - init

    init(trafficLightService: TrafficLightService) {
        self.trafficLightService = trafficLightService
    }

    // MARK: - func

    func setViewDelegate(trafficLightViewDelegate: TrafficLightViewDelegate?) {
        self.trafficLightViewDelegate = trafficLightViewDelegate
    }

    func trafficLightColorSelected(colorName: String) {
        self.trafficLightService.trafficLight(colorName: colorName) { [weak self] result in
            switch result {
            case .success(let trafficLight):
                self?.trafficLightViewDelegate?.displayTrafficLight(description: trafficLight.description)
            case .failure(let error):
                self?.trafficLightViewDelegate?.displayTrafficLight(description: error.errorDescription)
            }
        }
    }
}
