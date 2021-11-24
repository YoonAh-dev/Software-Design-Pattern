//
//  ThrottledTextFieldValidator.swift
//  MVC_tutorial_#3
//
//  Created by SHIN YOON AH on 2021/05/24.
//

import Foundation

final class ThrottledTextFieldValidator {
    private var lastQuery: String?
    private let throttle: Throttle
    private let validationRule: ((String) -> Bool)
    
    init(throttle: Throttle = Throttle(minimumDelay: 0.3),
         validationRule: @escaping ((String) -> Bool) = { query in return query.count > 2}) {
        self.throttle = throttle
        self.validationRule = validationRule
    }
    
    func validate(query: String,
                  completion: @escaping ((String?) -> ())) {
        guard validationRule(query), distinctUntilChanged(query) else {
            completion(nil)
            return
        }
        throttle.throttle {
            completion(query)
        }
    }
    
    private func distinctUntilChanged(_ query: String) -> Bool {
        let valid = lastQuery != query
        lastQuery = query
        return valid
    }
}
