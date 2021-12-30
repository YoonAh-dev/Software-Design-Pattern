//
//  ViewController.swift
//  MVVM_tutorial_#1
//
//  Created by SHIN YOON AH on 2021/04/29.
//

import UIKit

class ViewController: UIViewController {
    
    // 코드로 생성해서 TableViewCell 연결
    private var models = [Person]()
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(
            PersonFollowingTableViewCell.self,
            forCellReuseIdentifier: PersonFollowingTableViewCell.identifier)
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureModels()
        setTableView()
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(
                withIdentifier: "PersonFollowingTableViewCell",
                for: indexPath
        ) as? PersonFollowingTableViewCell else {
           return UITableViewCell()
        }
        cell.configure(
            with: PersonFollowingTableViewCellViewModel(with: model)
        )
        cell.delegate = self
        return cell
    }
}

extension ViewController: PersonFollowingTableViewCellDelegate {
    func personFollowingTableViewCell(_ cell: PersonFollowingTableViewCell, didTapWith viewModel: PersonFollowingTableViewCellViewModel) {
        
    }
}

// MARK: - UI, Data
extension ViewController {
    private func configureModels() {
        let names = [
        "Joe", "Dan", "Jeff", "Jenny", "Emily"
        ]
        
        for name in names {
            models.append(Person(name: name))
        }
    }
    
    private func setTableView() {
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.frame = view.bounds
    }
}
