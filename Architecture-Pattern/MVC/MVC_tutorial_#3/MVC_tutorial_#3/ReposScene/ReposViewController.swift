//
//  ReposViewController.swift
//  MVC_tutorial_#3
//
//  Created by SHIN YOON AH on 2021/05/24.
//

import UIKit

final class ReposViewController: UIViewController {
    private let tableView = UITableView()
    private let searchController = UISearchController(searchResultsController: nil)
    
    private let fetcher = CancellabelReposFetcher()
    private let validator = ThrottledTextFieldValidator()
    private let dataSource = ReposDataSource()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        startFetching(forQuery: "rxswift")
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        definesPresentationContext = true
        
        searchController.searchResultsUpdater = self
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.dimsBackgroundDuringPresentation = false
        tableView.tableHeaderView = searchController.searchBar
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.dataSource = dataSource
        tableView.delegate = self
    }
    
    private func didChangeQuery(_ query: String) {
        validator.validate(query: query) { [weak self] query in
            guard let strongSelf = self, let query = query else { return }
            strongSelf.startFetching(forQuery: query)
        }
    }
    
    private func startFetching(forQuery query: String) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        fetcher.fetchRepos(withQuery: query, completion: { [weak self] repos in
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            guard let strongSelf = self else { return }
            strongSelf.dataSource.data = repos
            strongSelf.tableView.reloadData()
        })
    }

    private func didSelectRow(at indexPath: IndexPath) {
        guard let data = dataSource.data else { return }
        let id = data[indexPath.item].id
        
        let alertController = UIAlertController(title: "\(id)", message: nil, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
}

extension ReposViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        didSelectRow(at: indexPath)
    }
}

extension ReposViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        didChangeQuery(searchController.searchBar.text ?? "")
    }
}

