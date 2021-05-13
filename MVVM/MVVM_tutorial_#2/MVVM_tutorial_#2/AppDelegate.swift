//
//  AppDelegate.swift
//  MVVM_tutorial_#2
//
//  Created by SHIN YOON AH on 2021/05/02.
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // scene 열거형에 있는 listscene를 부름
        // 앱이 시작되면 storage와 coordinator가 실행
        let storage = MemoryStorage()
        let coordinator = SceneCoordinator(window: window!)
        // viewModel이 이 두 instance를 가지고 메모를 저장하고 화면 전환을 처리
        // 이들에 대한 의존성은 init()를 할 때 주입됨
        let listViewModel = MemoListViewModel(title: "나의 메모", sceneCoordinator: coordinator, storage: storage)
        // Scene를 생성하고 연관값으로 viewModel를 넣어줌
        let listScene = Scene.list(listViewModel)
        
        // coordinator에서 transition method를 호출하고 listScene를 rootScene으로 설정
        coordinator.transition(to: listScene, using: .root, animated: false)
        
        return true
    }

    // MARK: UISceneSession Lifecycle

//    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
//        // Called when a new scene session is being created.
//        // Use this method to select a configuration to create the new scene with.
//        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
//    }
//
//    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
//        // Called when the user discards a scene session.
//        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
//        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
//    }


}

