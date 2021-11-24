//
//  ReposDataSource.swift
//  MVC_tutorial_#3
//
//  Created by SHIN YOON AH on 2021/05/24.
//

import UIKit

final class ReposDataSource: NSObject, UITableViewDataSource {
    var data: [Repo]?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let data = data else { return UITableViewCell() }
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row].name
        return cell
    }
}
