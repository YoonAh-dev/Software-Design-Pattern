//
//  MoviesResponse+DomainMapping.swift
//  Data
//
//  Created by Oleh Kudinov on 12.08.19.
//  Copyright © 2019 Oleh Kudinov. All rights reserved.
//

import Foundation
import Domain

extension MoviesPage {
    static func map(moviesPage: MoviesPageResponse) -> MoviesPage {
        return MoviesPage(page: moviesPage.page,
                          totalPages: moviesPage.totalPages,
                          movies: moviesPage.movies.map(Movie.map))
    }
}

extension Movie {
    static func map(_ movie: MovieResponse) -> Movie  {
        return Movie(id: movie.id,
                     title: movie.title,
                     posterPath: movie.posterPath,
                     overview: movie.overview,
                     releaseDate: movie.releaseDate)
    }
}
