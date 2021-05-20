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
}
