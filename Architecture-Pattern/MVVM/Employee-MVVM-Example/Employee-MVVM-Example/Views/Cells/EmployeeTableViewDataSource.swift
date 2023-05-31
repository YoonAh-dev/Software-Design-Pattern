//
//  EmployeeTableViewDataSource.swift
//  Employee-MVVM-Example
//
//  Created by SHIN YOON AH on 2023/05/31.
//

import UIKit

final class EmployeeTableViewDataSource<Cell: UITableViewCell, T>: NSObject, UITableViewDataSource {

    private let identifier: String
    private let items: [T]
    private let configureCell: ((Cell, T) -> Void)?

    init(identifier: String, items: [T], configureCell: ((Cell, T) -> Void)? = nil) {
        self.identifier = identifier
        self.items = items
        self.configureCell = configureCell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: self.identifier, for: indexPath) as? Cell else { return UITableViewCell() }
        let item = self.items[indexPath.row]

        self.configureCell?(cell, item)

        return cell
    }
}
