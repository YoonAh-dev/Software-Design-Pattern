//
//  ViewController.swift
//  Login-Adapter
//
//  Created by SHIN YOON AH on 2021/12/01.
//

import UIKit

class ViewController: UIViewController {
    
    enum LoginType {
        case normal
        case naver
        case kakao
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("""
        원하시는 로그인 방법을 선택해 주세요.
        1. 기본 로그인
        2. 네이버 로그인
        3. 카카오 로그인
        """)
        print("로그인 방법 : ", separator: "", terminator: "")
        let loginType = readLine()
        if loginType == "1" {
            print("Normal Login")
            login(loginType: .normal)
        } else if loginType == "2" {
            print("Naver Login")
            login(loginType: .naver)
        } else if loginType == "3" {
            print("Kakao Login")
            login(loginType: .kakao)
        } else {
            print("잘못된 입력입니다. 다시 선택해주세요.")
        }
    }
    
    func login(loginType: LoginType) {
        var authentication: LoginService?
        print("Email을 입력하세요 : ", terminator: "")
        let email = readLine()!
        print("Password를 입력하세요 : ", terminator: "")
        let password = readLine()!
        
        switch loginType {
        case .normal:
            authentication = NormalLogin()
            authentication?.login(email: email, password: password, success: { (normalAccount, token) in
                if let email = normalAccount?.email, let token = token?.value {
                    print("Normal 계정 로그인 성공!")
                    print("normalAccount : \(email)")
                    print("normalToken : \(token)")
                }
            }, failure: { (error) in
                if let error = error {
                    print(error.errorMessage)
                }
            })
        case .naver:
            authentication = NaverAccountAdapter()
            authentication?.login(email: email, password: password, success: { (naverAccount, token) in
                if let email = naverAccount?.email, let token = token?.value {
                    print("Naver 계정 로그인 성공!")
                    print("naverAccount : \(email)")
                    print("naverToken : \(token)")
                }
            }, failure: { (error) in
                if let error = error {
                    print(error.errorMessage)
                }
            })
        case .kakao:
            authentication = KakaoAccountAdapter()
            authentication?.login(email: email, password: password, success: { (kakaoAccount, token) in
                if let email = kakaoAccount?.email, let token = token?.value {
                    print("Kakao 계정 로그인 성공!")
                    print("kakaoAccount : \(email)")
                    print("kakaoToken : \(token)")
                }
            }, failure: { (error) in
                if let error = error {
                    print(error.errorMessage)
                }
            })
        }
    }


}
