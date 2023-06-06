//
//  ViewModel.swift
//  Two-Way-Binding-MVVM
//
//  Created by SHIN YOON AH on 2023/05/31.
//

import Foundation

// MARK: - Purple Button ViewModel(Delegate Pattern)

final class PurpleViewModel {

    weak var delegate: PurpleButtonDelegate?

    func updateText() {
        self.delegate?.updateText("Purple Button is Tapped")
    }
}

// MARK: - Purple Button ViewModel(Closure)

//final class ViewModel {
//
//    private var text: String = "" {
//        willSet {
//            self.didSetText?(newValue)
//        }
//    }
//
//    var didSetText: ((String) -> Void)?
//
//    func updateText() {
//        self.text = "Purple Button is Tapped"
//    }
//}

// MARK: - Red Button ViewModel(Observable)

final class RedViewModel {

    let text: Observable<String> = Observable(value: "")

    func updateText() {
        self.text.value = "Red Button is Tapped"
    }
}
