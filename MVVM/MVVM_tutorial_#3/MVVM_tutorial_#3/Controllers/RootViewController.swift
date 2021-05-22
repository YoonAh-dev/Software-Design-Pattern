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
    
    private let articleViewModel = BehaviorRelay<[ArticleViewModel]>(value: [])
    var articleViewModelObserver: Observable<[ArticleViewModel]> {
        return articleViewModel.asObservable()
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
        viewModel.fetchArticles().subscribe(onNext: { articleViewModel in
            self.articleViewModel.accept(articleViewModel)
        })
        .disposed(by: disposeBag)
    }
    
    func subscribe() {
        self.articleViewModelObserver.subscribe(onNext: { articles in
            //collection reload
            print(articles)
        })
        .disposed(by: disposeBag)
    }
}
