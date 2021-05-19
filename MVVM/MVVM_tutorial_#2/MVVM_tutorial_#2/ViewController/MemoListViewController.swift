//
//  MemoListViewController.swift
//  MVVM_tutorial_#2
//
//  Created by SHIN YOON AH on 2021/05/06.
//

import UIKit
import RxSwift
import RxCocoa
import NSObject_Rx

class MemoListViewController: UIViewController, ViewModelBindableType {
    
    var viewModel: MemoListViewModel!
    
    @IBOutlet weak var addButton: UIBarButtonItem!
    @IBOutlet weak var listTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // ViewModel과 View를 binding
    func bindViewModel() {
        // ViewModel에 저장되어 있는 title를
        // navigationTitle과 binding
        // ViewModel에 저장된 title이 navigationBar에 표시
        viewModel.title
            .drive(navigationItem.rx.title)
            .disposed(by: rx.disposeBag)
        
        // 메모 목록을 TableView에 binding
        // Observable과 TableView를 binding
        // DataSource 메소드 구현없이 짧은 코드로 테이블뷰에 데이터 표시
        // cell를 재사용 Queue에서 꺼내서 return하는 부분도 자동으로 처리 -> closure에서 셀 구성 코드만 짜면 됨
        // memo목록을 방출하는 Observable과 tableView를 binding
        viewModel.memoList
            .bind(to: listTableView.rx.items(cellIdentifier: "cell")) { row, memo, cell in
                cell.textLabel?.text = memo.content
            }
            .disposed(by: rx.disposeBag)
        
        addButton.rx.action = viewModel.makeCreateAction()
    }
}
