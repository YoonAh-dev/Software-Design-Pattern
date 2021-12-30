//
//  CancellabelReposFetcher.swift
//  MVC_tutorial_#3
//
//  Created by SHIN YOON AH on 2021/05/24.
//

import Foundation

final class CancellabelReposFetcher {
    private var currentSearchNetworkTask: URLSessionDataTask?
    private let networkingService: NetworkingService
    
    init(networkingService: NetworkingService = NetworkingApi()) {
        self.networkingService = networkingService
    }
    
    func fetchRepos(withQuery query: String, completion: @escaping (([Repo]) -> ())) {
        currentSearchNetworkTask?.cancel()
        
        _ = currentSearchNetworkTask = networkingService.searchRepos(withQuery: query) { repos in
            completion(repos)
        }
    }
}
