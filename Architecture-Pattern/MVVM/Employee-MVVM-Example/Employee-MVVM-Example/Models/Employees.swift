//
//  Employees.swift
//  Employee-MVVM-Example
//
//  Created by SHIN YOON AH on 2023/05/31.
//

import Foundation

struct Employees: Decodable {
    let status: String
    let message: String
    let data: [EmployeeData]
}

struct EmployeeData: Decodable {
    let id: Int
    let employeeName: String
    let employeeSalary, employeeAge: Int
    let profileImage: String

    enum CodingKeys: String, CodingKey {
        case id
        case employeeName = "employee_name"
        case employeeSalary = "employee_salary"
        case employeeAge = "employee_age"
        case profileImage = "profile_image"
    }
}
