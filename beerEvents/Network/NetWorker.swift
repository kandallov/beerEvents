//
//  NetWorker.swift
//  beerEvents
//
//  Created by Aleksandr Kandalov on 12/18/18.
//  Copyright © 2018 Aleksandr Kandalov. All rights reserved.
//

import UIKit

final class NetWorker {
    
    static let shared = NetWorker()
    
    let defaultSession = URLSession(configuration: .default)
    var dataTask: URLSessionDataTask?
    
    func buildRequest(method: String, url: String, params: [(String, String)], completion: @escaping (Data) -> ()) {
        dataTask?.cancel()
        let baseUrl = URL(string: url)!
        var request = URLRequest(url: baseUrl)
        let queryItems = params.map { URLQueryItem(name: $0.0, value: $0.1) }
        let urlComponents = NSURLComponents(url: baseUrl, resolvingAgainstBaseURL: true)!
        urlComponents.queryItems = queryItems
        request.url = urlComponents.url
        request.httpMethod = method
        
        dataTask = defaultSession.dataTask(with: request) { data, response, error in
            defer { self.dataTask = nil }
            if let error = error {
                print("DataTask Error: \(error.localizedDescription)")
            } else if let data = data, let response = response as? HTTPURLResponse, response.statusCode == 200 {
                DispatchQueue.main.async {
                    completion(data)
                }
            }
        }
        dataTask?.resume()
    }
}
