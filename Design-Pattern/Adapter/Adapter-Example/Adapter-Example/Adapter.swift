//
//  Adapter.swift
//  Adapter-Example
//
//  Created by SHIN YOON AH on 2021/12/01.
//

import Foundation

class Target {
    func request() -> String {
        return "Target"
    }
}

class Adaptee {
    public func specificRequest() -> String {
        return "Adaptee's specificRequest."
    }
}

class Adapter: Target {
    private var adaptee: Adaptee
    
    init(_ adaptee: Adaptee) {
        self.adaptee = adaptee
    }
    
    override func request() -> String {
        return self.adaptee.specificRequest()
    }
}

class Client {
    static func specificRequest(target: Target) {
        print("Call from adapter - \(target.request())")
    }
}
