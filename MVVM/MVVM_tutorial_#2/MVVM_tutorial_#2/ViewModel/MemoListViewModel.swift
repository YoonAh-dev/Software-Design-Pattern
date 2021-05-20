//
//  MemoListViewModel.swift
//  MVVM_tutorial_#2
//
//  Created by SHIN YOON AH on 2021/05/06.
//

import Foundation
import RxSwift
import RxCocoa
import Action

// 의존성을 주입하는 생성자와 바인딩에 사용되는 속성과 메소드가 추가됨.
// 화면 전환과 메모 저장을 모두 처리
// Scene Coordinator와 MemoStorage를 활용
// ViewModel 생성하는 시점에 생성자를 통해서 의존성 주입
class MemoListViewModel: CommonViewModel {
    // TableView와 바인딩할 수 있는 속성 추가
    var memoList: Observable<[Memo]> {
        // storage에 저장되어 있는 memoList메소드를 호출하고
        // 메소드가 리턴하는 Observable 그대로 리턴
        return storage.memoList()
    }
    
    // String을 받아서 입력값으로 메모를 업데이트
    func performUpdate(memo: Memo) -> Action<String, Void> {
        return Action { input in
            // observable이 방출하는 게 Void
            // 하지만 update가 방출하는게 Void가 아님 그래서 error가 발생 그래서 map으로 문제 해결
            return self.storage.update(memo: memo, content: input).map { _ in }
        }
    }
    
    func performCancel(memo: Memo) -> CocoaAction {
        return Action {
            // 생성된 메모를 삭제하는 일 -> 밑에서 createMemo를 하면 실제로 memo가 생성되고 Observable로 방출됨
            // 그래서 삭제를 안하면 불필요한 메모가 저장, 테이블뷰에 올라감
            return self.storage.delete(memo: memo).map { _ in }
        }
    }
    
    // + 버튼을 누르면 쓰기화면을 modal형태로 present
    // 새로운 메모가 생성되고 이 메모를 방출하는 옵져버블 return
    func makeCreateAction() -> CocoaAction {
        return CocoaAction { _ in
            return self.storage.createMemo(content: "")
                .flatMap { memo -> Observable<Void> in
                    // closure에서 화면 전환 처리
                    // 내용없는 메모 생성
                    let composeViewModel = MemoComposeViewModel(title: "새 메모",
                                                                sceneCoordinator: self.sceneCoordinator,
                                                                storage: self.storage,
                                                                saveAction: self.performUpdate(memo: memo),
                                                                cancelAction: self.performCancel(memo: memo))
                    // 연관값으로 viewmodel를 저장
                    let composeScene = Scene.compose(composeViewModel)
                    
                    // sceneCoordinator에서 transition method를 호출하고 scene를 modal방식으로 표시
                    // transition method는 completable를 return
                    // map 연산자로 void를 return하는 걸로 바꿔줘야 함
                    return self.sceneCoordinator.transition(to: composeScene,
                                                            using: .modal,
                                                            animated: true).asObservable().map { _ in }
                }
        }
    }
    
    // 속성 형태로 보기 화면 이동 구현
    // closure 내부에서 self에 접근해야해서 lazy로 선언함
    lazy var detailAction: Action<Memo, Void> = {
        return Action { memo in
            // 뷰 모델 생성 + scene 생성 + sceneCoordinator에서 transition method 호출
            let detailViewModel = MemoDetailViewModel(memo: memo,
                                                      title: "메모 보기",
                                                      sceneCoordinator: self.sceneCoordinator,
                                                      storage: self.storage)
            let detailScene = Scene.detail(detailViewModel)
            
            // transition method를 호출하고 push방식으로
            return self.sceneCoordinator.transition(to: detailScene,
                                                    using: .push,
                                                    animated: true).asObservable().map { _ in }
        }
    }()
}
