//
//  CommonViewModel.swift
//  MVVM_tutorial_#2
//
//  Created by SHIN YOON AH on 2021/05/13.
//

import Foundation
import RxSwift
import RxCocoa

// 앱을 구성하고 있는 모든 Scene은 NavigationController
// 에 embeded되기 때문에 navigation Title이 필요
class CommonViewModel: NSObject {
    // driver 형식으로 title 선언
    // 이렇게 하면 Navigation item에 쉽게 바인딩 가능
    let title: Driver<String>
    // protocol로 선언
    // 의존성을 쉽게 수정가능
    let sceneCoordinator: SceneCoordinatorType
    let storage: MemoStorageType
    
    init(title: String,
         sceneCoordinator: SceneCoordinatorType,
         storage: MemoStorageType) {
        self.title = Observable.just(title).asDriver(onErrorJustReturn: "")
        self.sceneCoordinator = sceneCoordinator
        self.storage = storage
    }
}
