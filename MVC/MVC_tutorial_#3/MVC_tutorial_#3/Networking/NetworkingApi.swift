//
//  NetworkingApi.swift
//  MVC_tutorial_#3
//
//  Created by SHIN YOON AH on 2021/05/24.
//

import Foundation

protocol NetworkingService {
    @discardableResult
    func searchRepos(withQuery query: String, completion: @escaping ([Repo]) -> ()) -> URLSessionDataTask
}

fileprivate struct SearchResponse: Decodable {
    let items: [Repo]
}

final class NetworkingApi: NetworkingService {
    private let session = URLSession.shared
    
    @discardableResult
    func searchRepos(withQuery query: String, completion: @escaping ([Repo]) -> ()) -> URLSessionDataTask {
        let request = URLRequest(url: URL(string: "https://api.github.com/search/repositories?q=\(query)")!)
        let task = session.dataTask(with: request) { (data, _, _) in
            DispatchQueue.main.async {
                guard let data = data,
                      let response = try? JSONDecoder().decode(SearchResponse.self, from: data) else {
                    completion([])
                    return
                }
                completion(response.items)
            }
        }
        task.resume()
        return task
    }
}
