//
//  MemoDetailViewController.swift
//  MVVM_tutorial_#2
//
//  Created by SHIN YOON AH on 2021/05/06.
//

import UIKit

class MemoDetailViewController: UIViewController, ViewModelBindableType {
    
    var viewModel: MemoDetailViewModel!
    
    @IBOutlet weak var deleteButton: UIBarButtonItem!
    @IBOutlet weak var editButton: UIBarButtonItem!
    @IBOutlet weak var shareButton: UIBarButtonItem!
    @IBOutlet weak var listTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func bindViewModel() {
        viewModel.title
            .drive(navigationItem.rx.title)
            .disposed(by: rx.disposeBag)
        
        viewModel.contents
            .bind(to: listTableView.rx.items) { tableview, row, value in
                switch row {
                // 첫번째 cell이라면 content cell를 꺼내서 label에 문자열을 표시하고 return
                case 0:
                    let cell = tableview.dequeueReusableCell(withIdentifier: "contentCell")!
                    cell.textLabel?.text = value
                    return cell
                // 두번째 cell이라면 dateCell를 꺼내서 같은 방식으로 구현
                case 1:
                    let cell = tableview.dequeueReusableCell(withIdentifier: "dateCell")!
                    cell.textLabel?.text = value
                    return cell
                default:
                    fatalError()
                }
            }
            .disposed(by: rx.disposeBag)
    }
}
