//
//  EmployeeAPIService.swift
//  Employee-MVVM-Example
//
//  Created by SHIN YOON AH on 2023/05/31.
//

import Foundation

struct EmployeeAPIService {

    private let baseURL = URL(string: "http://dummy.restapiexample.com/api/v1/employees")!

    func fetchEmployeeData(completion: @escaping (Employees) -> ()){
        URLSession.shared.dataTask(with: baseURL) { (data, urlResponse, error) in
            if let data = data {
                let jsonDecoder = JSONDecoder()

                let decodedData = try! jsonDecoder.decode(Employees.self, from: data)
                completion(decodedData)
            }
        }.resume()
    }
}
