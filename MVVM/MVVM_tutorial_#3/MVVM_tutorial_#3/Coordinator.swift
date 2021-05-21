//
//  Coordinator.swift
//  MVVM_tutorial_#3
//
//  Created by SHIN YOON AH on 2021/05/20.
//

import UIKit

class Coordinator {
    let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let rootViewController = RootViewController(viewModel: RootViewModel(articleService: ArticleService()))
        let navigationRoonViewController = UINavigationController(rootViewController: rootViewController)
        // controller 지정 후 화면에 rendering
        window.rootViewController = navigationRoonViewController
        window.makeKeyAndVisible()
    }
}
