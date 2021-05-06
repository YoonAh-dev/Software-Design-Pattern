//
//  SceneCoordinator.swift
//  MVVM_tutorial_#2
//
//  Created by SHIN YOON AH on 2021/05/06.
//

import Foundation
import RxSwift
import RxCocoa

class SceneCoordinator: SceneCoordinatorType {
    // 리소스 정리
    private let bag = DisposeBag()
    // 화면 전환을 담당하기 때문에 윈도우 인스턴스와 현재 화면에 표시되어 있는 신을 가지고 있어야 함
    private var window: UIWindow
    private var currentVC: UIViewController
    
    // 위에 속성 초기화해주는 메소드
    required init(window: UIWindow) {
        self.window = window
        currentVC = window.rootViewController!
    }
    
    @discardableResult
    func transition(to scene: Scene, using style: TransitionStyle, animated: Bool) -> Completable {
        // 전환 결과를 방출할 Subject
        let subject = PublishSubject<Void>()
        
        let target = scene.instantiate()
        
        switch style {
        case .root:
            currentVC = target
            window.rootViewController = target
            subject.onCompleted()
        case .push:
            guard let nav = currentVC.navigationController else {
                subject.onError(TransitionError.navigationControllerMissing)
                break
            }
            
            nav.pushViewController(target, animated: animated)
            currentVC = target
            
            subject.onCompleted()
        case .modal:
            currentVC.present(target, animated: animated) {
                subject.onCompleted()
            }
            currentVC = target
        }
        
        // subject를 return할때 ignoreElement를 호출하면 Completable로 변환되어 리턴
        // but error 발생해서 asCompletable() 넣어줌
        // 시작부터 Completable로 만들 수 있지만 create 연산자로 만들어야 하고 클로져 내부에서 구현해야
        // 하기 때문에 코드가 복잡해짐
        // 따라서 PublishSubject와 ignore연산자 사용
        return subject.ignoreElements().asCompletable()
    }
    
    @discardableResult
    func close(animated: Bool) -> Completable {
        // Completable 직접 생성하는 방식
        return Completable.create { [unowned self] completable in
            // modal 방식으로 되어있다면 현재 씬을 dismiss
            if let presentingVC = self.currentVC.presentingViewController {
                self.currentVC.dismiss(animated: animated) {
                    self.currentVC = presentingVC
                    completable(.completed)
                }
            } else if let nav = self.currentVC.navigationController {
                // navigation이면 pop
                guard nav.popViewController(animated: animated) != nil else {
                    completable(.error(TransitionError.cannotPop))
                    return Disposables.create()
                }
                self.currentVC = nav.viewControllers.last!
                completable(.completed)
            } else {
                completable(.error(TransitionError.unknown))
            }
            
            return Disposables.create()
        }
    }
}
