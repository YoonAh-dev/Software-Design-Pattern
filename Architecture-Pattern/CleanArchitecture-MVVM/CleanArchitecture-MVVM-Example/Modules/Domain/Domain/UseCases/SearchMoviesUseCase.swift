//
//  SearchMoviesUseCase.swift
//  ExampleMVVM
//
//  Created by Oleh Kudinov on 22.02.19.
//

import Foundation
import Common

public protocol SearchMoviesUseCase {
    func execute(requestValue: SearchMoviesUseCaseRequestValue,
                 completion: @escaping (Result<MoviesPage, Error>) -> Void) -> Cancellable?
}

public class DefaultSearchMoviesUseCase: SearchMoviesUseCase {

    let moviesRepository: MoviesRepository
    let moviesQueriesRepository: MoviesQueriesRepository
    
    public init(moviesRepository: MoviesRepository, moviesQueriesRepository: MoviesQueriesRepository) {
        self.moviesRepository = moviesRepository
        self.moviesQueriesRepository = moviesQueriesRepository
    }
    
    public func execute(requestValue: SearchMoviesUseCaseRequestValue,
                 completion: @escaping (Result<MoviesPage, Error>) -> Void) -> Cancellable? {
        return moviesRepository.moviesList(query: requestValue.query, page: requestValue.page) { [weak self] result in
            guard let strongSelf = self else { return }
            
            switch result {
            case .success:
                strongSelf.moviesQueriesRepository.saveRecentQuery(query: requestValue.query)
                return completion(result)
            case .failure:
                return completion(result)
            }
        }
    }
}

public struct SearchMoviesUseCaseRequestValue {
    let query: MovieQuery
    let page: Int
    
    public init(query: MovieQuery, page: Int) {
        self.query = query
        self.page = page
    }
}
