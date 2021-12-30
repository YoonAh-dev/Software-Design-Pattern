//
//  LoginService.swift
//  Login-Adapter
//
//  Created by SHIN YOON AH on 2021/12/01.
//

import Foundation

protocol LoginService {
    func login(email: String,
               password: String,
               success: @escaping (User?, Token?) -> Void,
               failure: @escaping (LoginError?) -> Void)
}

struct User {
    let email: String
    let password: String
}

struct Token {
    let value: String
}

struct LoginError: Error {
    var errorMessage: String
}

class NormalLogin: LoginService {
    func login(email: String, password: String, success: @escaping (User?, Token?) -> Void, failure: @escaping (LoginError?) -> Void) {
        if !email.hasSuffix("normal.com") {
            failure(LoginError(errorMessage: "email 에러"))
            return
        }
        
        let token = Token(value: "아무도 모르는 Normal 비밀 토큰")
        let user = User(email: email, password: password)
        success(user, token)
    }
}
