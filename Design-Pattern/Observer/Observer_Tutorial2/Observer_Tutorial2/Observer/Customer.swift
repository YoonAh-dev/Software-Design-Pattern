//
//  Customer.swift
//  Observer_Tutorial2
//
//  Created by SHIN YOON AH on 2021/11/24.
//

import Foundation

class Customer: Observer {
    var id: String
    
    init(id: String) {
        self.id = id
    }
    
    func update(message: String) {
        print("\(id)님 \(message)수신\n")
    }
}
