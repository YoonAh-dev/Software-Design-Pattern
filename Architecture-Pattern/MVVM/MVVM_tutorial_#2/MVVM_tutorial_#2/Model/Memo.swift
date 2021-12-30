//
//  Memo.swift
//  MVVM_tutorial_#2
//
//  Created by SHIN YOON AH on 2021/05/02.
//

import Foundation
import RxDataSources
// tableview와 collectionView에 binding할 수 있는 datasource 제공
// identifiable protocol를 채용해야 함

// 얘네가 같냐 아니냐를 비교할 수 있는 타입
// Equatable 타입
struct Memo: Equatable, IdentifiableType {
    var content: String
    var insertDate: Date
    var identity: String
    
    init(content: String, insertDate: Date = Date()) {
        self.content = content
        self.insertDate = insertDate
        self.identity = "\(insertDate.timeIntervalSinceReferenceDate)"
    }
    
    // update된 내용으로 새로운 메모 인스턴스를 생성할때
    // 사용하는 init
    init(original: Memo, updateContent: String) {
        self = original
        self.content = updateContent
    }
}
