//
//  Subject.swift
//  Observer_tutorial
//
//  Created by SHIN YOON AH on 2021/11/24.
//

import Foundation

// 관찰자들을 저장할 observer 리스트
protocol Subject {
    var observers: [Observer] { get set }
}

// 관찰자 추가 및 관찰자에게 변동 통보하는 메소드
extension Subject {
    mutating func attach(observer: Observer) {
        self.observers.append(observer)
    }
    
    func notifyObservers() {
        self.observers.forEach {
            $0.update()
        }
    }
}
