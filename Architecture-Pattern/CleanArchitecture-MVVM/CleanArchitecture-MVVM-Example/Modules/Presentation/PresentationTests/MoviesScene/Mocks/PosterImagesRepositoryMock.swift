//
//  PosterImagesRepositoryMock.swift
//  ExampleMVVMTests
//
//  Created by Oleh Kudinov on 17.08.19.
//

import Foundation
import XCTest
import Presentation
import Domain
import Common

class PosterImagesRepositoryMock: PosterImagesRepository {
    var expectation: XCTestExpectation?
    var error: Error?
    var image = Data()
    var validateInput: ((String, Int) -> Void)?
    
    func image(with imagePath: String, width: Int, completion: @escaping (Result<Data, Error>) -> Void) -> Cancellable? {
        validateInput?(imagePath, width)
        if let error = error {
            completion(.failure(error))
        } else {
            completion(.success(image))
        }
        expectation?.fulfill()
        return nil
    }
}
