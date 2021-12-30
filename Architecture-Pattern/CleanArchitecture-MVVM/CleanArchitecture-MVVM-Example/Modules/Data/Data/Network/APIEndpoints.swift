//
//  MovieEndpoints.swift
//  ExampleMVVM
//
//  Created by Oleh Kudinov on 01.10.18.
//

import Foundation
import Domain
import Networking

struct APIEndpoints {
    
    static func movies(query: String, page: Int) -> DataEndpoint<MoviesPageResponse> {
        
        return DataEndpoint(path: "3/search/movie/",
                            queryParameters: ["query": query,
                                              "page": "\(page)"])
    }
    
    static func moviePoster(path: String, width: Int) -> DataEndpoint<Data> {
        
        let sizes = [92, 185, 500, 780]
        let closestWidth = sizes.enumerated().min { abs($0.1 - width) < abs($1.1 - width) }?.element ?? sizes.first!
        
        return DataEndpoint(path: "t/p/w\(closestWidth)\(path)")
    }
}
