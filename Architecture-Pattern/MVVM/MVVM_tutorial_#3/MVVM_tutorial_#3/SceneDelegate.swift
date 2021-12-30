//
//  SceneDelegate.swift
//  MVVM_tutorial_#3
//
//  Created by SHIN YOON AH on 2021/05/20.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        
        self.window = UIWindow(windowScene: scene)
        
        let coordinator = Coordinator(window: self.window!)
        coordinator.start()
    }
}

