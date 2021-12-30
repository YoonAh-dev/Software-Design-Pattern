//
//  SceneCoordinatorType.swift
//  MVVM_tutorial_#2
//
//  Created by SHIN YOON AH on 2021/05/06.
//

import Foundation
import RxSwift

// 프로토콜을 선언하고 Scene Coordinator가 공통적으로 구현해야하는 멤버를 선언
// Completable에 구독자를 추가하고 화면 전환이 완료된 후에 원하는 작업을 구현
// return형 사용하지 않는다는 경고 발생하지 않음
protocol SceneCoordinatorType {
    // 새로운 씬을 표시하는 method
    // 대상 씬, transitionStyle, animation flag 전달
    @discardableResult
    func transition(to scene: Scene, using style: TransitionStyle, animated: Bool) -> Completable
    
    // 현재 씬 닫기
    @discardableResult
    func close(animated: Bool) -> Completable
}
