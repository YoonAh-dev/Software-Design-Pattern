//
//  MemoStorageType.swift
//  MVVM_tutorial_#2
//
//  Created by SHIN YOON AH on 2021/05/02.
//

import Foundation
import RxSwift

// 기본적인 CRUD 선언하는 메소드
protocol MemoStorageType {
    // 구독자가 작업 결과를 원하는 방식으로 처리할 수 있도록
    @discardableResult
    func createMemo(content: String) -> Observable<Memo>
    
    @discardableResult
    func memoList() -> Observable<[Memo]>
    
    @discardableResult
    func update(memo: Memo, content: String) -> Observable<Memo>
    
    @discardableResult
    func delete(memo: Memo) -> Observable<Memo>
}
