//
//  ViewModel.swift
//  MVVMExmaple
//
//  Created by SHIN YOON AH on 2023/05/31.
//

import Foundation

class ViewModel {

    var helloText = Dynamic("")

    func userTriggerSayHelloButton() {
        self.helloText.value = "Hello"
    }
}
