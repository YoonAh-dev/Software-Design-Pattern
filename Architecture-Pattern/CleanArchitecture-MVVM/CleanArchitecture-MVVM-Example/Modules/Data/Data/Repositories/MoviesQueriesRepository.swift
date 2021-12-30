//
//  MoviesQueriesRepository.swift
//  ExampleMVVM
//
//  Created by Oleh Kudinov on 15.02.19.
//

import Foundation
import Domain
import Networking

public class DefaultMoviesQueriesRepository {
    
    private let dataTransferService: DataTransfer
    private var moviesQueriesPersistentStorage: MoviesQueriesStorage
    
    public init(dataTransferService: DataTransfer, moviesQueriesPersistentStorage: MoviesQueriesStorage) {
        self.dataTransferService = dataTransferService
        self.moviesQueriesPersistentStorage = moviesQueriesPersistentStorage
    }
}

extension DefaultMoviesQueriesRepository: MoviesQueriesRepository {
    
    public func recentsQueries(number: Int) -> [MovieQuery] {
        return moviesQueriesPersistentStorage.recentsQueries(number: number)
    }
    
    public func saveRecentQuery(query: MovieQuery) {
        moviesQueriesPersistentStorage.saveRecentQuery(query: query)
    }
}
