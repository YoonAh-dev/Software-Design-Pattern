//
//  FetchMoviesRecentQueriesUseCase.swift
//  ExampleMVVM
//
//  Created by Oleh Kudinov on 11.08.19.
//

import Foundation
import Common

public protocol FetchMoviesRecentQueriesUseCase {
    func execute(requestValue: FetchMoviesRecentQueriesUseCaseRequestValue,
                 completion: @escaping (Result<[MovieQuery], Error>) -> Void) -> Cancellable?
}

public class DefaultFetchMoviesRecentQueriesUseCase: FetchMoviesRecentQueriesUseCase {
    
    let moviesQueriesRepository: MoviesQueriesRepository
    
    public init(moviesQueriesRepository: MoviesQueriesRepository) {
        self.moviesQueriesRepository = moviesQueriesRepository
    }
    
    public func execute(requestValue: FetchMoviesRecentQueriesUseCaseRequestValue,
                 completion: @escaping (Result<[MovieQuery], Error>) -> Void) -> Cancellable? {
        completion(.success(moviesQueriesRepository.recentsQueries(number: requestValue.number)))
        return nil
    }
}

public struct FetchMoviesRecentQueriesUseCaseRequestValue {
    let number: Int
    
    public init(number: Int) {
        self.number = number
    }
}
