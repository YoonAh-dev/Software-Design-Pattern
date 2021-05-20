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
        
        // tableview에서 메모를 선택하면 viewmodel를 통해서 detailAction를 전달하고(선택한 메모 필요)
        // 선택한 cell은 선택해제(indexPath 필요)
        // rxcocoa가 선택 이벤트 처리에 사용하는 다양한 멤버를 extension으로 제공
        // itemSelected로 indexPath를 가져옴
        // 메모가 필요하면 modelSelect 사용
        // zip으로 두 개가 return observable를 병합 -> 튜플 형태로 방출
        Observable.zip(listTableView.rx.modelSelected(Memo.self), listTableView.rx.itemSelected)
            .do(onNext: { [unowned self] (_, indexPath) in
                // 선택 상태 처리 완료
                self.listTableView.deselectRow(at: indexPath, animated: true)
            })
            // indexpath는 필요없기 때문에 data만 처리하도록 map사용
            .map { $0.0 }
            // 마지막으로 전달된 메모를 detailAction과 binding
            .bind(to: viewModel.detailAction.inputs)
            .disposed(by: rx.disposeBag)
            // 선택한 메모가 Action으로 전달되고 action에 구현되어 있는 코드가 실행
        
        // 삭제와 관련된 control event를 구독하면 swipe to delete가 자동으로 활성화됨
        listTableView.rx.modelDeleted(Memo.self)
            .bind(to: viewModel.deleteAction.inputs)
            .disposed(by: rx.disposeBag)
    }
}
