//
//  MemoComposeViewController.swift
//  MVVM_tutorial_#2
//
//  Created by SHIN YOON AH on 2021/05/06.
//

import UIKit
import RxSwift
import RxCocoa
import Action
import NSObject_Rx

class MemoComposeViewController: UIViewController, ViewModelBindableType {

    var viewModel: MemoComposeViewModel!
    
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var contentTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func bindViewModel() {
        viewModel.title
            .drive(navigationItem.rx.title)
            .disposed(by: rx.disposeBag)
        
        // 메모 쓰기 모드 -> 빈 문자열, 편집 모드 -> 편집할 내용
        viewModel.initalText
            .drive(contentTextView.rx.text)
            .disposed(by: rx.disposeBag)
        
        // 액션 패턴으로 액션을 구현할때는 액션 속성에 저장하는 방식으로 바인딩
        // 취소 버튼을 탭하면 cancelAction에 래핑되어 있는 코드가 실행
        cancelButton.rx.action = viewModel.cancelAction
        
        // 버튼을 탭하면 TextView에 저장된 문자열을 저장 -> cancel과 조금다른 방식
        saveButton.rx.tap
            // double tap를 막기위해서 처리
            .throttle(.milliseconds(500), scheduler: MainScheduler.instance)
            // textView에 입력된 text를 방출
            .withLatestFrom(contentTextView.rx.text.orEmpty)
            // 방출된 text를 saveAction과 binding
            .bind(to: viewModel.saveAction.inputs)
            .disposed(by: rx.disposeBag)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        contentTextView.becomeFirstResponder()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        if contentTextView.isFirstResponder {
            contentTextView.resignFirstResponder()
        }
    }
}
