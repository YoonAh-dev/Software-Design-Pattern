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
    
    private lazy var collectionView: UICollectionView = {
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout())
        
        cv.delegate = self
        cv.dataSource = self
        
        cv.backgroundColor = .systemBackground
        
        return cv
    }()
    
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
        configureCollectionView()
        fetchArticles()
        subscribe()
    }
    
    // MARK: - Configures
    func configureUI() {
        view.backgroundColor = .systemBackground
        
        self.title = self.viewModel.title
        
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    func configureCollectionView() {
        self.collectionView.register(ArticleCell.self, forCellWithReuseIdentifier: "cell")
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
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
            
            print(articles)
        })
        .disposed(by: disposeBag)
    }
}

extension RootViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.articleViewModel.value.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ArticleCell
        
        cell.imageView.image = nil
        
        let articleViewModel = self.articleViewModel.value[indexPath.row]
        cell.viewModel.onNext(articleViewModel)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 120)
    }
}
