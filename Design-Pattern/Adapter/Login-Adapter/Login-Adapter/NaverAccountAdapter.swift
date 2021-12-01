//
//  NaverAccountAdapter.swift
//  Login-Adapter
//
//  Created by SHIN YOON AH on 2021/12/01.
//

import Foundation

struct NaverAccount {
    var email: String
    var password: String
    var naverToken: String
}

class NaverAccountLogin {
    func login(email: String, password: String, completion: @escaping(NaverAccount?, LoginError?) -> Void) {
        if !email.hasSuffix("naver.com") {
            completion(nil, LoginError(errorMessage: "email 에러"))
            return
        }
        
        let token = "아무도 모르는 Naver 비밀 토큰"
        let user = NaverAccount(email: email, password: password, naverToken: token)
        completion(user, nil)
    }
}

class NaverAccountAdapter: LoginService {
    
    private var authenticator = NaverAccountLogin()
    
    func login(email: String, password: String, success: @escaping (User?, Token?) -> Void, failure: @escaping (LoginError?) -> Void) {
        authenticator.login(email: email, password: password) { (naverAccount, error) in
            guard let naverAccount = naverAccount else {
                failure(error)
                return
            }

            let user = User(email: naverAccount.email, password: naverAccount.password)
            let token = Token(value: naverAccount.naverToken)
            success(user, token)
        }
    }
}
