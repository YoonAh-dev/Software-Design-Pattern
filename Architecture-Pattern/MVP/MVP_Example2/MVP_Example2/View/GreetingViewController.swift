//
//  GreetingViewController.swift
//  MVP_Example2
//
//  Created by SHIN YOON AH on 2023/04/09.
//

import UIKit

protocol GreetingViewDelegate: AnyObject {
    func displayGreeting(text: String)
}

final class GreetingViewController: UIViewController, GreetingViewDelegate {

    // MARK: - ui component

    @IBOutlet weak var greetingLabel: UILabel!

    // MARK: - property

    private let greetingPresenter: GreetingPresenter = GreetingPresenter(personService: PersonService())

    // MARK: - life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.greetingPresenter.configureDelegation(self)
    }

    // MARK: - func

    func displayGreeting(text: String) {
        self.greetingLabel.text = text
    }

    // MARK: - selector

    @IBAction func greetingButtonTapped(_ sender: Any) {
        let dummyPerson = Person(firstName: "Yoonah", lastName: "Shin")
        self.greetingPresenter.makeWelcomeText(of: dummyPerson)
    }
}
