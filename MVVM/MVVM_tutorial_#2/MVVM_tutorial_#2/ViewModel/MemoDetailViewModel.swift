//
//  MemoDetailViewModel.swift
//  MVVM_tutorial_#2
//
//  Created by SHIN YOON AH on 2021/05/06.
//

import RxSwift
import RxCocoa
import Action

class MemoDetailViewModel: CommonViewModel {
    let memo: Memo
    
    // 이전 scene에서 전달된 메모가 저장
    private var formatter: DateFormatter = {
        let f = DateFormatter()
        f.locale = Locale(identifier: "Ko_kr")
        f.dateStyle = .medium
        f.timeStyle = .medium
        return f
    }()
    
    // 왜 behaviorsubject인가
    // 메모를 편집한 다음에 다시 보기화면으로 오면 편집한 화면이 반영되어야 한다
    // 이렇게 하기 위해서 새로운 문자열 배열을 방출해야 한다
    // 일반 observable로 하면 이게 불가능하기 때문에 이렇게 선언
    var contents: BehaviorSubject<[String]>
    
    init(memo: Memo,
         title: String,
         sceneCoordinator: SceneCoordinatorType,
         storage: MemoStorageType) {
        self.memo = memo
        
        contents = BehaviorSubject<[String]>(value: [
            memo.content,
            formatter.string(from: memo.insertDate)
        ])
        
        super.init(title: title,
                   sceneCoordinator: sceneCoordinator,
                   storage: storage)
    }
    
    // String을 받아서 입력값으로 메모를 업데이트
    func performUpdate(memo: Memo) -> Action<String, Void> {
        return Action { input in
            // observable이 방출하는 게 Void
            // 하지만 update가 방출하는게 Void가 아님 그래서 error가 발생 그래서 map으로 문제 해결
            self.storage.update(memo: memo, content: input)
                .subscribe(onNext: { updated in
                    // 새로운 내용을 subject에서 next 이벤트로 방출하게 됨
                    // subject와 binding되어 있는 tableView가
                    // 새로운 내용으로 update
                    self.contents.onNext([
                        updated.content,
                        self.formatter.string(from: updated.insertDate)
                    ])
                })
                .disposed(by: self.rx.disposeBag)
            
            return Observable.empty()
        }
    }
    
    func makeEditAction() -> CocoaAction {
        return CocoaAction { _ in
            let composeViewModel = MemoComposeViewModel(title: "메모 편집",
                                                        content: self.memo.content,
                                                        sceneCoordinator: self.sceneCoordinator,
                                                        storage: self.storage,
                                                        saveAction: self.performUpdate(memo: self.memo))
            let composeScene = Scene.compose(composeViewModel)
            
            return self.sceneCoordinator.transition(to: composeScene,
                                                    using: .modal,
                                                    animated: true).asObservable().map { _ in }
        }
    }
}
