//
//  MoviesQueriesTableViewController.swift
//  ExampleMVVM
//
//  Created by Oleh on 03.10.18.
//

import Foundation
import UIKit
import Common

public class MoviesQueriesTableViewController: UITableViewController, StoryboardInstantiable {
    
    public var viewModel: MoviesQueryListViewModel!
    
    public class func create(with viewModel: MoviesQueryListViewModel) -> MoviesQueriesTableViewController {
        let viewController = instantiateViewController(Bundle(for: MoviesQueriesTableViewController.self))
        viewController.viewModel = viewModel
        return viewController
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        tableView.backgroundColor = .clear
        
        bind(to: viewModel)
    }
    
    private func bind(to viewModel: MoviesQueryListViewModel) {
        viewModel.items.observe(on: self) { [unowned self] _ in
            self.tableView.reloadData()
        }
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        viewModel.viewWillAppear()
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate
extension MoviesQueriesTableViewController {
    
    public override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.items.value.count
    }
    
    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MoviesQueriesItemCell.reuseIdentifier, for: indexPath) as! MoviesQueriesItemCell
        cell.fill(with: viewModel.items.value[indexPath.row])
        
        return cell
    }
    
    public override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        viewModel.didSelect(item: viewModel.items.value[indexPath.row])
    }
}
