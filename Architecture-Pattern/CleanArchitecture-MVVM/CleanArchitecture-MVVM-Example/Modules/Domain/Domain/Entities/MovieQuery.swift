//
//  MovieQuery.swift
//  ExampleMVVM
//
//  Created by Oleh on 03.10.18.
//

import Foundation

public struct MovieQuery {
    public let query: String
    
    public init(query: String) {
        self.query = query
    }
}

extension MovieQuery: Equatable {
    public static func == (lhs: MovieQuery, rhs: MovieQuery) -> Bool {
        return (lhs.query == rhs.query)
    }
}
