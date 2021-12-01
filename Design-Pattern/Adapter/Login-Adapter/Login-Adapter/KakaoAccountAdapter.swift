//
//  KakaoAccountAdapter.swift
//  Login-Adapter
//
//  Created by SHIN YOON AH on 2021/12/01.
//

import Foundation

struct KakaoAccount {
    var email: String
    var password: String
    var kakaoToken: String
}

class KakaoAccountLogin {
    func login(email: String, password: String, completion: @escaping(KakaoAccount?, LoginError?) -> Void) {
        if !email.hasSuffix("kakao.com") {
            completion(nil, LoginError(errorMessage: "email 에러"))
            return
        }
        
        let token = "아무도 모르는 Kakao 비밀 토큰"
        let user = KakaoAccount(email: email, password: password, kakaoToken: token)
        completion(user, nil)
    }
}

class KakaoAccountAdapter: LoginService {
    
    private var authenticator = KakaoAccountLogin()
    
    func login(email: String,
               password: String,
               success: @escaping (User?, Token?) -> Void,
               failure: @escaping (LoginError?) -> Void) {
        authenticator.login(email: email, password: password) { (kakaoAccount, error) in
            guard let kakaoAccount = kakaoAccount else {
                failure(error)
                return
            }
            
            let user = User(email: kakaoAccount.email,
                            password: kakaoAccount.password)
            let token = Token(value: kakaoAccount.kakaoToken)
            success(user, token)
        }
    }
}
