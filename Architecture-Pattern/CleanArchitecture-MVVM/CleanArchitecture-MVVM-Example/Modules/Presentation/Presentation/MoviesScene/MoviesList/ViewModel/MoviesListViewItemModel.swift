//
//  MoviesListViewItemModel.swift
//  ExampleMVVM
//
//  Created by Oleh Kudinov on 18.02.19.
//

import Foundation
import Common
import Domain

extension MoviesListViewModel {
    
    public class Item: Equatable {
        
        private(set) var id: Int
        private(set) var posterPath: String?
        
        // MARK: - OUTPUT
        public let title: String
        public let overview: String
        public let releaseDate: String
        public private(set) var posterImage: Observable<Data?> = Observable(nil)
        
        private let posterImagesRepository: PosterImagesRepository
        private var imageLoadTask: Cancellable? { willSet { imageLoadTask?.cancel() } }

        init(movie: Movie,
             posterImagesRepository: PosterImagesRepository) {
            self.id = movie.id
            self.title = movie.title
            self.posterPath = movie.posterPath
            self.overview = movie.overview
            self.releaseDate = movie.releaseDate != nil ? dateFormatter.string(from: movie.releaseDate!) : NSLocalizedString("To be announced", comment: "")
            self.posterImagesRepository = posterImagesRepository
        }
    }
}

// MARK: - INPUT. View event methods
extension MoviesListViewModel.Item {
    
    public func viewDidLoad() {}
    
    public func updatePosterImage(width: Int) {
        posterImage.value = nil
        guard let posterPath = posterPath else { return }
        
        imageLoadTask = posterImagesRepository.image(with: posterPath, width: width) { [weak self] result in
            guard self?.posterPath == posterPath else { return }
            switch result {
            case .success(let data):
                self?.posterImage.value = data
            case .failure: break
            }
            self?.imageLoadTask = nil
        }
    }
}

public func ==(lhs: MoviesListViewModel.Item, rhs: MoviesListViewModel.Item) -> Bool {
    return (lhs.id == rhs.id)
}

fileprivate let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .medium
    return formatter
}()
