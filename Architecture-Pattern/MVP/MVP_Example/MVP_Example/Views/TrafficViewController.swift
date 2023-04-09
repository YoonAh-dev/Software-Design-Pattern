//
//  TrafficViewController.swift
//  MVP_Example
//
//  Created by SHIN YOON AH on 2023/04/09.
//

import UIKit

protocol TrafficLightViewDelegate: AnyObject {
    func displayTrafficLight(description: String)
}

final class TrafficViewController: UIViewController, TrafficLightViewDelegate {

    // MARK: - ui component

    @IBOutlet weak var descriptionLabel: UILabel!

    // MARK: - property

    private let trafficLightPresenter = TrafficLightPresenter(trafficLightService: TrafficLightService())

    // MARK: - life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.trafficLightPresenter.setViewDelegate(trafficLightViewDelegate: self)
    }

    // MARK: - func
    
    func displayTrafficLight(description: String) {
        self.descriptionLabel.text = description
    }

    // MARK: - selector


    @IBAction func touchUpRedLight(_ sender: Any) {
        self.trafficLightPresenter.trafficLightColorSelected(colorName: "Red")
    }

    @IBAction func touchUpYellowLight(_ sender: Any) {
        self.trafficLightPresenter.trafficLightColorSelected(colorName: "Yellow")
    }

    @IBAction func touchUpGreenLight(_ sender: Any) {
        self.trafficLightPresenter.trafficLightColorSelected(colorName: "Green")
    }

    @IBAction func touchUpBlueLight(_ sender: Any) {
        self.trafficLightPresenter.trafficLightColorSelected(colorName: "Blue")
    }

}
