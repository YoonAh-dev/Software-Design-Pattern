//
//  ArticleViewModel.swift
//  MVVM_tutorial_#3
//
//  Created by SHIN YOON AH on 2021/05/22.
//

import Foundation

struct ArticleViewModel {
    private let article: Article
    
    var imageUrl: String? {
        return article.urlToImage
    }
    
    var title: String? {
        return article.title
    }
    
    var description: String? {
        return article.description
    }
    
    init(article: Article) {
        self.article = article
    }
}
