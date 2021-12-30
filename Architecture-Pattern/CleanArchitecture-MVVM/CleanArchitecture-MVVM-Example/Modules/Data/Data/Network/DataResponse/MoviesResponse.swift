//
//  Movie+Decodable.swift
//  ExampleMVVM
//
//  Created by Oleh on 22.09.18.
//

import Foundation
import Domain

public struct MoviesPageResponse: Decodable {
    public let page: Int
    public let totalPages: Int
    public let movies: [MovieResponse]
    
    private enum CodingKeys: String, CodingKey {
        case page
        case totalPages = "total_pages"
        case movies = "results"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.page = try container.decode(Int.self, forKey: .page)
        self.totalPages = try container.decode(Int.self, forKey: .totalPages)
        self.movies = try container.decode([MovieResponse].self, forKey: .movies)
    }
}

public struct MovieResponse: Decodable {
    public let id: MovieId
    public let title: String
    public let posterPath: String?
    public let overview: String
    public let releaseDate: Date?
    
    private enum CodingKeys: String, CodingKey {
        
        case id
        case title
        case posterPath = "poster_path"
        case overview
        case releaseDate = "release_date"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.title = try container.decode(String.self, forKey: .title)
        self.posterPath = try container.decodeIfPresent(String.self, forKey: .posterPath)
        self.overview = try container.decode(String.self, forKey: .overview)
        let releaseDateString = try container.decode(String.self, forKey: .releaseDate)
        releaseDate = DateFormatter.yyyyMMdd.date(from: releaseDateString)
    }
}

fileprivate extension DateFormatter {
    static let yyyyMMdd: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        return formatter
    }()
}
