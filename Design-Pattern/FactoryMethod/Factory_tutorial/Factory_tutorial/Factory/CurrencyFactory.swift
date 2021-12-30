//
//  CurrencyFactory.swift
//  Factory_tutorial
//
//  Created by SHIN YOON AH on 2021/11/24.
//

import Foundation

enum CurrencyFactory {
    static func currency(for country: Country) -> CurrencyDescribing? {
        switch country {
        case .unitedStates:
            return UnitedStatesDollar()
        case .spain, .greece:
            return Euro()
        default:
            return nil
        }
    }
}
