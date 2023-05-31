//
//  EmployeeViewModel.swift
//  Employee-MVVM-Example
//
//  Created by SHIN YOON AH on 2023/05/31.
//

import Foundation

final class EmployeeViewModel {

    private let apiService: EmployeeAPIService

    private(set) var employees: Employees? {
        didSet {
            self.bindEmployeeData?()
        }
    }

    var bindEmployeeData: (() -> Void)?

    init(apiService: EmployeeAPIService) {
        self.apiService = apiService
    }

    func fetchEmployeeData() {
        self.apiService.fetchEmployeeData { data in
            self.employees = data
        }
    }
}
