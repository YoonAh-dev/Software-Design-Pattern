//
//  GreetingPresenter.swift
//  MVP_Example2
//
//  Created by SHIN YOON AH on 2023/04/09.
//

import Foundation

final class GreetingPresenter {

    // MARK: - property

    private let personService: PersonService
    private weak var viewDelegate: GreetingViewDelegate?

    // MARK: - init

    init(personService: PersonService) {
        self.personService = personService
    }

    // MARK: - func

    func configureDelegation(_ viewDelegate: GreetingViewDelegate?) {
        self.viewDelegate = viewDelegate
    }

    func makeWelcomeText(of user: Person) {
        let welcomeText = self.personService.welcomeWithFullName(of: user)
        self.viewDelegate?.displayGreeting(text: welcomeText)
    }
}
