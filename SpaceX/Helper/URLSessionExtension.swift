//
//  URLSessionExtension.swift
//  SpaceX
//
//  Created by Emil Shpeklord on 04.05.2022.
//

import Foundation

extension URLSession {
    func helperDataTask(
        with request: URLRequest,
        handler: @escaping (Result<Data, DataTaskError>) -> Void
    ) {
        dataTask(with: request) { data, _, error in
            if error != nil {
                handler(.failure(.notFound))
            } else if data == nil {
                handler(.failure(.incorrectJson))
            } else {
                handler(.success(data ?? Data()))
            }
        }.resume()
    }
}
