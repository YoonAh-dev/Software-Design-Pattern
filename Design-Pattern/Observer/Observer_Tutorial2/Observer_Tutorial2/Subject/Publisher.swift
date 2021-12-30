//
//  Publisher.swift
//  Observer_Tutorial2
//
//  Created by SHIN YOON AH on 2021/11/24.
//

import Foundation

protocol Publisher {
    var observers: [Observer] { get set }
    
    func subscribe(observer: Observer)
    func unSubscribe(observer: Observer)
    func notify(message: String)
}
