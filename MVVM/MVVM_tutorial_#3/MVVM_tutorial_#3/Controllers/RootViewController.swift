//
//  RootViewController.swift
//  MVVM_tutorial_#3
//
//  Created by SHIN YOON AH on 2021/05/20.
//

import UIKit
import RxSwift
import RxRelay

class RootViewController: UIViewController {

    // MARK: - Properties
    let viewModel: RootViewModel
    let disposeBag = DisposeBag()
    
    // articles를 subscribe하기 위해서 RxRelay사용
    private let articles = BehaviorRelay<[Article]>(value: [])
    var articlesObserver: Observable<[Article]> {
        return articles.asObservable()
    }
    
    // MARK: - LifeCycles
    
    // 굳이 생성자를 사용하는 이유? ViewModel에서 생성자 사용하는 이유와 동일
    // RootViewController가 viewModel에 관해 관심을 가지지 않게 하기 위해서
    init(viewModel: RootViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        fetchArticles()
        subscribe()
    }
    
    // MARK: - Configures
    func configureUI() {
        view.backgroundColor = .systemBackground
    }
    
    // MARK: - Helpers
    func fetchArticles() {
        self.viewModel.fetchArticles()
            .subscribe(onNext: { articles in
                print(articles)
                // articles에 articles를 넣어줌
                // articles에 값이 들어올때마다 이것들을 관찰하고 싶어함
                self.articles.accept(articles)
            })
            .disposed(by: disposeBag)
    }
    
    func subscribe() {
        self.articlesObserver.subscribe(onNext: { articles in
            // articles의 값이 변화하게 되면
            // collectionView를 생성을 할건데요, 이 때 collectionView.reloadData함수를 호출해준다
        })
        .disposed(by: disposeBag)
    }
}
