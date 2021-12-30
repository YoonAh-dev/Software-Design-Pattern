//
//  MoviesListTableViewController.swift
//  ExampleMVVM
//
//  Created by Oleh Kudinov on 01.10.18.
//

import Foundation
import UIKit

class MoviesListTableViewController:  UITableViewController {
    
    var nextPageLoadingSpinner: UIActivityIndicatorView?
    
    var viewModel: MoviesListViewModel!
    var items: [MoviesListViewModel.Item]! {
        didSet { reload() }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = MoviesListItemCell.height
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    func reload() {
        tableView.reloadData()
    }
    
    func update(isLoadingNextPage: Bool) {
        if isLoadingNextPage {
            nextPageLoadingSpinner?.removeFromSuperview()
            nextPageLoadingSpinner = UIActivityIndicatorView(style: .gray)
            nextPageLoadingSpinner?.startAnimating()
            nextPageLoadingSpinner?.isHidden = false
            nextPageLoadingSpinner?.frame = CGRect(x: CGFloat(0), y: CGFloat(0), width: tableView.frame.width, height: 44)
            tableView.tableFooterView = nextPageLoadingSpinner
        }
        else {
            tableView.tableFooterView = nil
        }
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate
extension MoviesListTableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.items.value.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MoviesListItemCell.reuseIdentifier, for: indexPath) as! MoviesListItemCell
        
        cell.fill(with: viewModel.items.value[indexPath.row])
        
        if indexPath.row == viewModel.items.value.count - 1 {
            viewModel.didLoadNextPage()
        }
        
        cell.accessibilityLabel = String(format: NSLocalizedString("Result row %d", comment: ""), indexPath.row + 1)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel.isEmpty ? tableView.frame.height : super.tableView(tableView, heightForRowAt: indexPath)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didSelect(item: items[indexPath.row])
    }
}
