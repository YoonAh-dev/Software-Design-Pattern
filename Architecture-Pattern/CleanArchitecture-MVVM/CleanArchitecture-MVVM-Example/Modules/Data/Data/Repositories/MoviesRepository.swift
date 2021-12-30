//
//  MoviesRepository.swift
//  ExampleMVVM
//
//  Created by Oleh Kudinov on 01.10.18.
//

import Foundation
import Common
import Domain
import Networking

public class DefaultMoviesRepository {
    
    private let dataTransferService: DataTransfer
    
    public init(dataTransferService: DataTransfer) {
        self.dataTransferService = dataTransferService
    }
}

extension DefaultMoviesRepository: MoviesRepository {

    public func moviesList(query: MovieQuery, page: Int, with result: @escaping (Result<MoviesPage, Error>) -> Void) -> Cancellable? {
        let endpoint = APIEndpoints.movies(query: query.query, page: page)
        
        return self.dataTransferService.request(with: endpoint) { (response: Result<MoviesPageResponse, Error>) in
            switch response {
            case .success(let moviesPage):
                result(.success(MoviesPage.map(moviesPage: moviesPage)))
                return
            case .failure(let error):
                result(.failure(error))
                return
            }
        }
    }
}
