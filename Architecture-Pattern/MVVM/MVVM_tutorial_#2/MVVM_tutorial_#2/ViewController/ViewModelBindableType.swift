//
//  ViewModelBindableType.swift
//  MVVM_tutorial_#2
//
//  Created by SHIN YOON AH on 2021/05/06.
//

import UIKit

// ViewModel과 View를 binding하기 위한 프로토콜
protocol ViewModelBindableType {
    // ViewModel의 타입은 ViewController마다 달라지기 때문에
    // Protocol를 제네릭 프로토콜로 선언
    associatedtype ViewModelType
    
    var viewModel: ViewModelType! { get set }
    func bindViewModel()
}

// ViewController에 추가된 ViewModel 속성에 실제 ViewModel를 저장하고
// BindViewModel 메소드를 자동으로 추가하는 메소드 구현
extension ViewModelBindableType where Self: UIViewController {
    mutating func bind(viewModel: Self.ViewModelType) {
        self.viewModel = viewModel
        loadViewIfNeeded()
        
        bindViewModel()
    }
    // 개별 ViewController에서 bindViewModel method를 직접 호출할 필요가 없기 때문에 그만큼
    // 코드가 단순해짐
}
