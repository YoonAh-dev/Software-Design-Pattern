//
//  MoviesQueryListViewModel.swift
//  ExampleMVVM
//
//  Created by Oleh on 03.10.18.
//

import Foundation
import Common
import Domain

public protocol MoviesQueryListViewModelDelegate: class {
    
    func moviesQueriesListDidSelect(movieQuery: MovieQuery)
}

public class MoviesQueryListViewModel {

    public struct Item: Equatable {
        public let query: String
    }
    
    private let numberOfQueriesToShow: Int
    private let fetchMoviesRecentQueriesUseCase: FetchMoviesRecentQueriesUseCase
    private weak var delegate: MoviesQueryListViewModelDelegate?
    
    // MARK: - OUTPUT
    public private(set) var items: Observable<[Item]> = Observable([Item]())
    
    public init(numberOfQueriesToShow: Int,
         fetchMoviesRecentQueriesUseCase: FetchMoviesRecentQueriesUseCase,
         delegate: MoviesQueryListViewModelDelegate? = nil) {
        self.numberOfQueriesToShow = numberOfQueriesToShow
        self.fetchMoviesRecentQueriesUseCase = fetchMoviesRecentQueriesUseCase
        self.delegate = delegate
    }
    
    private func updateMoviesQueries() {
        let request = FetchMoviesRecentQueriesUseCaseRequestValue(number: numberOfQueriesToShow)
        _ = fetchMoviesRecentQueriesUseCase.execute(requestValue: request) { [weak self] result in
            switch result {
            case .success(let items):
                self?.items.value = items.map{ Item(query: $0.query) }
            case .failure: break
            }
        }
    }
}

// MARK: - INPUT. View event methods
extension MoviesQueryListViewModel {
    
    public func viewDidLoad() {}
    
    public func viewWillAppear() {
        updateMoviesQueries()
    }
    
    public func didSelect(item: MoviesQueryListViewModel.Item) {
        delegate?.moviesQueriesListDidSelect(movieQuery: MovieQuery(query: item.query))
    }
}
