//
//  EmployeeTableViewCell.swift
//  Employee-MVVM-Example
//
//  Created by SHIN YOON AH on 2023/05/31.
//

import UIKit

final class EmployeeTableViewCell: UITableViewCell {

    @IBOutlet weak var employeeIdLabel: UILabel!
    @IBOutlet weak var employeeNameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
