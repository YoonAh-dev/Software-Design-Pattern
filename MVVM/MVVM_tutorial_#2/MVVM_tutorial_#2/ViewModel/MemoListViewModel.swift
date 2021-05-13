//
//  MemoListViewModel.swift
//  MVVM_tutorial_#2
//
//  Created by SHIN YOON AH on 2021/05/06.
//

import Foundation
import RxSwift
import RxCocoa

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
}
