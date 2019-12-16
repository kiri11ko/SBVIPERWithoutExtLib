//
//  NetworkService.swift
//  VIPERSBCoreData
//
//  Created by Кирилл Лукьянов on 19.11.2019.
//  Copyright (c) 2019 Кирилл Лукьянов. All rights reserved.

import Foundation

class NetworkService: NetworkManager {
    func request<T: IEndpoint>(endpoint: T, completion: @escaping (Data?, Error?) -> Void) {
        var urlConstructor = URLComponents()
        urlConstructor.host = endpoint.host
        urlConstructor.path = endpoint.path
        urlConstructor.scheme = endpoint.scheme
        urlConstructor.queryItems = endpoint.queryItems
        let task = createDataTask(from: urlConstructor, completion: completion)
        task!.resume()
    }
    private func createDataTask(from urlConstructor: URLComponents,
                                completion: @escaping (Data?, Error?) -> Void) -> URLSessionDataTask? {
        guard let url = urlConstructor.url else { return nil }
        return URLSession.shared.dataTask(with: url, completionHandler: { (data, _, error) in
            DispatchQueue.main.async {
                completion(data, error)
            }
        })
    }

}
