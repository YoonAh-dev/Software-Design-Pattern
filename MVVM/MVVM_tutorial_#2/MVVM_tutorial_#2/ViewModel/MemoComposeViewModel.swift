//
//  MemoComposeViewModel.swift
//  MVVM_tutorial_#2
//
//  Created by SHIN YOON AH on 2021/05/06.
//

import Foundation
import RxSwift
import RxCocoa
import Action

// 새로운 메모 추가, 메모 편집에 사용
class MemoComposeViewModel: CommonViewModel {
    // 메모를 저장하는 속성
    // 새로운 메모 = Nil, 메모를 편집할라면 편집할 메모
    private let content: String?
    //뷰에 binding위해서
    var initalText: Driver<String?> {
        return Observable.just(content).asDriver(onErrorJustReturn: nil)
    }
    
    // 액션을 저장하는 속성
    // 저장과 취소 버튼을 두 액션과 바인딩
    let saveAction: Action<String, Void>
    let cancelAction: CocoaAction
    
    init(title: String,
         content: String? = nil,
         sceneCoordinator: SceneCoordinatorType,
         storage: MemoStorageType,
         saveAction: Action<String, Void>? = nil,
         cancelAction: CocoaAction? = nil) {
        self.content = content
        
        // saveAction으로 들어온 값을 그대로 저장하지 않고 Action으로 한 번 더 wrapping
        self.saveAction = Action<String, Void> { input in
            // 액션이 실제로 전달되었다면 액션을 실행하고 화면을 닫습니다.
            // 반대로 전달되지 않았다면 화면만 닫고 끝남
            if let action = saveAction {
                action.execute(input)
            }
            
            return sceneCoordinator.close(animated: true).asObservable().map { _ in }
        }
        
        self.cancelAction = CocoaAction {
            if let action = cancelAction {
                action.execute()
            }
            
            return sceneCoordinator.close(animated: true).asObservable().map { _ in }
        }
        
        super.init(title: title,
                   sceneCoordinator: sceneCoordinator,
                   storage: storage)
        
        // ViewModel에서 취소코드와 저장코드를 직접 구현해도 되지만, 지금 이렇게 parameter로 받고있죠
        // ViewModel에서 직접 구현하면 처리 방식이 하나로 고정됩니다.
        // 하지만 parameter로 받으면 이전 화면에서 처리 방식을 동적으로 결정할 수 있다는 장점이 있습니다.
    }
}
