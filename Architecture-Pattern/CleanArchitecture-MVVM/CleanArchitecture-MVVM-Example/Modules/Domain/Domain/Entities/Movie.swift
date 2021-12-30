//
//  Movie.swift
//  ExampleMVVM
//
//  Created by Oleh Kudinov on 01.10.18.
//

import Foundation

public typealias MovieId = Int

public struct MoviesPage {
    public let page: Int
    public let totalPages: Int
    public let movies: [Movie]
    
    public init(page: Int, totalPages: Int, movies: [Movie]) {
        self.page = page
        self.totalPages = totalPages
        self.movies = movies
    }
}

public struct Movie {
    public let id: MovieId
    public let title: String
    public let posterPath: String?
    public let overview: String
    public let releaseDate: Date?
    
    public init(id: MovieId,
         title: String,
         posterPath: String?,
         overview: String,
         releaseDate: Date?) {
        self.id = id
        self.title = title
        self.posterPath = posterPath
        self.overview = overview
        self.releaseDate = releaseDate
    }
}

extension Movie: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
