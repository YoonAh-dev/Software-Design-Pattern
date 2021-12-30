//
//  MovieDetailsViewModel.swift
//  ExampleMVVM
//
//  Created by Oleh Kudinov on 04.08.19.
//  Copyright (c) 2019 Company All rights reserved.
//

import Foundation
import Common
import Domain

public class MovieDetailsViewModel {
    
    private let posterPath: String?
    
    // MARK: - OUTPUT
    public private(set) var title: Observable<String> = Observable("")
    public private(set) var posterImage: Observable<Data?> = Observable(nil)
    public private(set) var overview: Observable<String> = Observable("")
    
    private let posterImagesRepository: PosterImagesRepository
    private var imageLoadTask: Cancellable? { willSet { imageLoadTask?.cancel() } }
    private var alreadyLoadedImageWidth: Int?
    
    public init(title: String,
         overview: String,
         posterPlaceholderImage: Data?,
         posterPath: String?,
         posterImagesRepository: PosterImagesRepository) {
        self.title.value = title
        self.overview.value = overview
        self.posterImage.value = posterPlaceholderImage
        self.posterPath = posterPath
        self.posterImagesRepository = posterImagesRepository
    }
}

// MARK: - INPUT. View event methods
extension MovieDetailsViewModel {
    public func viewDidLoad() { }
    
    public func updatePosterImage(width: Int) {
        guard let posterPath = posterPath, alreadyLoadedImageWidth != width  else { return }
        alreadyLoadedImageWidth = width
        
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
