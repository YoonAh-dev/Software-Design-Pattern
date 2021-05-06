//
//  MemoryStorage.swift
//  MVVM_tutorial_#2
//
//  Created by SHIN YOON AH on 2021/05/06.
//

import Foundation
import RxSwift

// 메모리에 메모 저장
// 배열을 변경한 다음에 Subject에서 새로운 Next 이벤트를 방출하는 패턴으로 구현
// 나중에 Subject를 테이블뷰와 바인딩할건데 이렇게 새로운 배열을 계속해서 방출해야
// TableView가 제대로 업데이트
// Cocoa 처럼 ReloadData로 호출하는 방식은 테이블뷰가 update 되지 않습니다.
class MemoryStorage: MemoStorageType {
    // 배열은 Observable를 통해서 외부로 공개가 된다
    // Observable은 배열의 상태가 update되면 새로운 next event를 방출해야 한다.
    // 그냥 Observable 형태로 만들면 이런게 불가능 -> Subject로 만들어야 한다
    // 초기에 더미데이터를 만들어야 하니깐 Subject 중에서 behavior subject로 만들어야 함.
    private var list = [
        Memo(content: "Hello", insertDate: Date().addingTimeInterval(-10)),
        Memo(content: "RxSwift", insertDate: Date().addingTimeInterval(-20)),
    ]
    
    // 기본값을 list배열로 선언하기 위해서 lazy로 선언했고 Subject도 외부에서 직접 접근할 필요가 없기 때문에
    // private으로 선언
    private lazy var store = BehaviorSubject<[Memo]>(value: list)
    
    // 새로운 매모를 생성하고 배열에 추가(CREATE)
    @discardableResult
    func createMemo(content: String) -> Observable<Memo> {
        let memo = Memo(content: content)
        list.insert(memo, at: 0)
        
        store.onNext(list)
        
        return Observable.just(memo)
    }
    
    // 클래스 외부에서는 항상 이 메소드를 통해서 Subject에 접근(READ)
    @discardableResult
    func memoList() -> Observable<[Memo]> {
        return store
    }
    
    // update된 메모 인스턴스를 생성
    @discardableResult
    func update(memo: Memo, content: String) -> Observable<Memo> {
        let updated = Memo(original: memo, updateContent: content)
        
        if let index = list.firstIndex(where: { $0 == memo }) {
            list.remove(at: index)
            list.insert(updated, at: index)
        }
        
        store.onNext(list)
        
        return Observable.just(updated)
    }
    
    // list 배열에서 메모를 삭제하고 Subject에서 새로운 Next 이벤트 방출
    @discardableResult
    func delete(memo: Memo) -> Observable<Memo> {
        if let index = list.firstIndex(where: { $0 == memo }) {
            list.remove(at: index)
        }
        
        store.onNext(list)
        
        return Observable.just(memo)
    }
}
