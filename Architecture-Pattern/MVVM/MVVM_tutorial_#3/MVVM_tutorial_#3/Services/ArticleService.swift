//
//  ArticleService.swift
//  MVVM_tutorial_#3
//
//  Created by SHIN YOON AH on 2021/05/21.
//

import Foundation
import Alamofire
import RxSwift

// Protocol은 타입으로 사용해주는 것이 좋다..!
protocol ArticleServiceProtocol {
    func fetchNews() -> Observable<[Article]>
}

// 실제로 서버 통신이 아닌 가짜 코드
//class stubArticleService: ArticleServiceProtocol {
//    func fetchNews() -> Observable<[Article]> {
//        return Observable.create { (observer) -> Disposable in
//
//            Article(author: "Yoonah",
//                    title: "MVVM",
//                    description: "MVVM is dangerous",
//                    url: "yoonah.com",
//                    urlToImage: "yoonah.jpg",
//                    publishedAt: "2021-05-22")
//            Article(author: "Yoonah",
//                    title: "MVVM",
//                    description: "MVVM is dangerous",
//                    url: "yoonah.com",
//                    urlToImage: "yoonah.jpg",
//                    publishedAt: "2021-05-22")
//            Article(author: "Yoonah",
//                    title: "MVVM",
//                    description: "MVVM is dangerous",
//                    url: "yoonah.com",
//                    urlToImage: "yoonah.jpg",
//                    publishedAt: "2021-05-22")
//            Article(author: "Yoonah",
//                    title: "MVVM",
//                    description: "MVVM is dangerous",
//                    url: "yoonah.com",
//                    urlToImage: "yoonah.jpg",
//                    publishedAt: "2021-05-22")
//
//            return Disposables.create()
//        }
//    }
//}

class ArticleService: ArticleServiceProtocol {

    // call back 함수 지옥을 방지한다.
    func fetchNews() -> Observable<[Article]> {
        return Observable.create { (observer) -> Disposable in
            self.fetchNews { (error, articles) in
                if let error = error {
                    observer.onError(error)
                }
                
                if let articles = articles {
                    observer.onNext(articles)
                }
                
                observer.onCompleted()
            }
            return Disposables.create()
        }
    }
    
    private func fetchNews(completion: @escaping((Error?, [Article]?) -> Void)) {
        let urlString = "https://newsapi.org/v2/everything?q=apple&from=2021-05-20&to=2021-05-20&sortBy=popularity&apiKey=96497db299454870a3b6a9c6bb28236f"
        
        guard let url = URL(string: urlString) else { return completion(NSError(domain: "YoonAh0525", code: 404, userInfo: nil), nil)}
        
        AF.request(url, method: HTTPMethod.get, parameters: nil, encoding: JSONEncoding.default, headers: nil, interceptor: nil, requestModifier: nil)
            .responseDecodable(of: ArticleResponse.self) { response in
                if let error = response.error {
                    return completion(error, nil)
                }
                
                if let articles = response.value?.articles {
                    return completion(nil, articles)
                }
            }
    }
}
