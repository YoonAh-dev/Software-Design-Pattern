//
//  Observable.swift
//  Two-Way-Binding-MVVM
//
//  Created by SHIN YOON AH on 2023/06/06.
//

import Foundation

final class Observable<T> {
    typealias Listener = (T) -> Void

    var value: T {
        didSet {
            self.listener?(value)
        }
    }

    var listener: Listener?

    init(value: T) {
        self.value = value
    }

    func bind(_ listener: Listener?) {
        self.listener = listener
    }
}
