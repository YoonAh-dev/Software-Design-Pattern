//
//  User.swift
//  MVVM_tutorial_#4
//
//  Created by SHIN YOON AH on 2021/05/22.
//

import Foundation

struct Contact: Codable {
    let contacts: [User]
}

struct User: Codable {
    let id: String
    let name: String
    let email: String
}
