//
//  PosterImagesRepository.swift
//  ExampleMVVM
//
//  Created by Oleh Kudinov on 01.10.18.
//

import Foundation
import Common
import Domain
import Networking

public class DefaultPosterImagesRepository {
    
    let dataTransferService: DataTransfer
    let imageNotFoundData: Data?
    
    public init(dataTransferService: DataTransfer,
         imageNotFoundData: Data?) {
        self.dataTransferService = dataTransferService
        self.imageNotFoundData = imageNotFoundData
    }
}

extension DefaultPosterImagesRepository: PosterImagesRepository {
    
    public func image(with imagePath: String, width: Int, completion: @escaping (Result<Data, Error>) -> Void) -> Cancellable? {
        let endpoint = APIEndpoints.moviePoster(path: imagePath, width: width)
        
        return dataTransferService.request(with: endpoint) { [weak self] (response: Result<Data, Error>) in
            guard let strongSelf = self else { return }
            
            switch response {
            case .success(let data):
                completion(.success(data))
                return
            case .failure(let error):
                if case let DataTransferError.networkFailure(networkError) = error, networkError.isNotFoundError,
                    let imageNotFoundData = strongSelf.imageNotFoundData {
                    completion(.success(imageNotFoundData))
                    return
                }
                completion(.failure(error))
                return
            }
        }
    }
}
