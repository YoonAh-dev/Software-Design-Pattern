//
//  RootViewModel.swift
//  MVVM_tutorial_#3
//
//  Created by SHIN YOON AH on 2021/05/22.
//

import Foundation
import RxSwift

final class RootViewModel {
    let title = "Yoonah News"
    
    // 테스트하기 좋게, 확장성있게, 재사용성, 프로토콜을 만들어주는게 좋음
    // 이 프로토콜을 가지고 있는게 확장성에 좋음
    // 의존성 주입 기법
    // 현업에서 많이 쓰이는 기법 중 하나
    private let articleService: ArticleServiceProtocol

    init(articleService: ArticleServiceProtocol) {
        self.articleService = articleService
    }
    
    func fetchArticles() -> Observable<[ArticleViewModel]> {
        // articleViewModel를 반환하는 함수
        articleService.fetchNews().map { $0.map { ArticleViewModel(article: $0) }}
    }
}
