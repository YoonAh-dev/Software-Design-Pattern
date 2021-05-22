//
//  Parser.swift
//  MVVM_tutorial_#4
//
//  Created by SHIN YOON AH on 2021/05/22.
//

import Foundation

struct Parser {
    func parse(comp: @escaping ([User]) -> ()) {
        let api = URL(string: "https://api.androidhive.info/contacts/")
        
        URLSession.shared.dataTask(with: api!) { data, response, error in
            if error != nil {
                print(error?.localizedDescription)
                return
            }
            
            do {
                let result = try JSONDecoder().decode(Contact.self, from: data!)
                comp(result.contacts)
            } catch {
                
            }
        }.resume()
    }
}
