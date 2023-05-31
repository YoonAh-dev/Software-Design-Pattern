//
//  ViewController.swift
//  Employee-MVVM-Example
//
//  Created by SHIN YOON AH on 2023/05/31.
//

import UIKit

final class ViewController: UIViewController {

    @IBOutlet weak var employeeTableView: UITableView!

    private var dataSource: EmployeeTableViewDataSource<EmployeeTableViewCell, EmployeeData>!

    private var viewModel: EmployeeViewModel?

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.viewModel = EmployeeViewModel(apiService: EmployeeAPIService())
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.bindViewModel()
    }

    private func bindViewModel() {
        self.viewModel?.bindEmployeeData = {
            self.updateTableDataSource()
        }
    }

    private func updateTableDataSource() {
        if let data = self.viewModel?.employees?.data {
            self.dataSource = EmployeeTableViewDataSource(identifier: "EmployeeTableViewCell", items: data) { cell, item in
                cell.employeeIdLabel.text = item.id.description
                cell.employeeNameLabel.text = item.employeeName
            }

            DispatchQueue.main.async {
                self.employeeTableView.dataSource = self.dataSource
                self.employeeTableView.reloadData()
            }
        }
    }

    @IBAction func didTapFetchButton() {
        self.viewModel?.fetchEmployeeData()
    }
}
