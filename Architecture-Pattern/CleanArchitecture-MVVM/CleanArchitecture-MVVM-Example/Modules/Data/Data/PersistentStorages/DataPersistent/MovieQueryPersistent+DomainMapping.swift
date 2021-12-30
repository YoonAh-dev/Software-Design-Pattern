//
//  MovieQueryPersistent+DomainMapping.swift
//  Data
//
//  Created by Oleh Kudinov on 12.08.19.
//  Copyright © 2019 Oleh Kudinov. All rights reserved.
//

import Foundation
import Domain

extension MovieQuery {
    static func map(movieQueryPersistent: MovieQueryPersistent) -> MovieQuery {
        return MovieQuery(query: movieQueryPersistent.query)
    }
}

extension MovieQueryPersistent {
    static func map(movieQuery: MovieQuery) -> MovieQueryPersistent  {
        return MovieQueryPersistent(query: movieQuery.query)
    }
}
