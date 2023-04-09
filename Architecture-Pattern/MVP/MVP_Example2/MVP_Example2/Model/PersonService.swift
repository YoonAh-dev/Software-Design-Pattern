//
//  PersonService.swift
//  MVP_Example2
//
//  Created by SHIN YOON AH on 2023/04/09.
//

import Foundation

final class PersonService {
    func welcomeWithFullName(of person: Person) -> String {
        return "Hello \(person.firstName) \(person.lastName)"
    }
}
