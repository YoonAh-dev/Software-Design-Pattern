//
//  Scene.swift
//  MVVM_tutorial_#2
//
//  Created by SHIN YOON AH on 2021/05/06.
//

import UIKit

enum Scene {
    case list(MemoListViewModel)
    case detail(MemoDetailViewModel)
    case compose(MemoComposeViewModel)
}

// 스토리 보드에 있는 씬을 생성하고 연관값이 저장된 뷰 모델을 바인딩해서 리턴하는 메소드를 구현
extension Scene {
    func instantiate(from storyboard: String = "Main") -> UIViewController {
        let storyboard = UIStoryboard(name: storyboard, bundle: nil)
        
        switch self {
        case .list(let viewModel):
            // ViewModel은 NavigationController에 embeded되어있는 rootViewController에 binding
            // return 할 때는 navigationController를 return 해야 함
            guard let nav = storyboard.instantiateViewController(withIdentifier: "ListNavigation") as? UINavigationController else {
                fatalError()
            }
            
            guard var listVC = nav.viewControllers.first as? MemoListViewController else {
                fatalError()
            }
            
            listVC.bind(viewModel: viewModel)
            return nav
            
        // 내비게이션 스택에 푸시 되기 때문에 네비게이션 Controller를 고려할 필요 없음
        case .detail(let viewModel):
            guard var detailVC = storyboard.instantiateViewController(withIdentifier: "MemoDetailViewController") as? MemoDetailViewController else {
                fatalError()
            }
            detailVC.bind(viewModel: viewModel)
            return detailVC
            
        case .compose(let viewModel):
            guard let nav = storyboard.instantiateViewController(withIdentifier: "ComposeNavigation") as? UINavigationController else {
                fatalError()
            }
            
            guard var composeVC = nav.viewControllers.first as? MemoComposeViewController else {
                fatalError()
            }
            
            // 실제 씬과 뷰 모델을 바인딩하고 네비게이션 컨트롤러를 리턴
            composeVC.bind(viewModel: viewModel)
            return nav
        }
    }
}
