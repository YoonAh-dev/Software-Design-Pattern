//
//  MoviesQueriesStorage.swift
//  ExampleMVVM
//
//  Created by Oleh on 03.10.18.
//

import Foundation
import Domain

public protocol MoviesQueriesStorage {
    func recentsQueries(number: Int) -> [MovieQuery]
    func saveRecentQuery(query: MovieQuery)
}

struct MovieQueriesList: Codable {
    var list: [MovieQueryPersistent]
}

public class DefaultMoviesQueriesStorage {
    private let userDefaultsKey = "recentsMoviesQueries"
    private let maxRecentsCount = 20
    private var userDefaults: UserDefaults { return UserDefaults.standard }
    private var moviesQuries: [MovieQuery] {
        get {
            if let queriesData = userDefaults.object(forKey: userDefaultsKey) as? Data {
                let decoder = JSONDecoder()
                if let movieQueryList = try? decoder.decode(MovieQueriesList.self, from: queriesData) {
                    return movieQueryList.list.map(MovieQuery.map)
                }
            }
            return []
        }
        set {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(MovieQueriesList(list: newValue.map(MovieQueryPersistent.map))) {
                userDefaults.set(encoded, forKey: userDefaultsKey)
            }
        }
    }
    
    public init() { }
}

extension DefaultMoviesQueriesStorage: MoviesQueriesStorage {
    public func recentsQueries(number: Int) -> [MovieQuery] {
        let queries = moviesQuries
        let subrangeQueries = queries.count < number ? queries : Array(queries[0..<number])
        return subrangeQueries
    }
    public func saveRecentQuery(query: MovieQuery) {
        var queries = moviesQuries
        queries = queries.filter { $0 != query }
        queries.insert(query, at: 0)
        queries = queries.count <= maxRecentsCount ? queries : Array(queries[0..<maxRecentsCount])
        moviesQuries = queries
    }
}
