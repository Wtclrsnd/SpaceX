//
//  URLHelper.swift
//  SpaceX
//
//  Created by Emil Shpeklord on 27.04.2022.
//

import Foundation
import UIKit

final class URLHelper {
    static var shared = URLHelper()

    func fetch<T: Codable>(request: URLRequest, model: T.Type, completion: @escaping (T) -> Void) {
        URLSession.shared.helperDataTask(with: request) { result in
            do {
                switch result {
                case .success(let data):
                    let jsonDecoder = JSONDecoder()
                    let responseObject = try jsonDecoder.decode(
                        model,
                        from: data
                    )
                    completion(responseObject)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
//        URLSession.shared.dataTask(with: request) { data, _, error in
//            guard error == nil else {
//                print(String(describing: error?.localizedDescription))
//                return
//            }
//            guard let data = data else {
//                return // return cutom error
//            }
//            let jsonDecoder = JSONDecoder()
//
//            do {
//                let responseObject = try jsonDecoder.decode(
//                    model,
//                    from: data
//                )
//                completion(responseObject)
//            } catch let error {
//                print(String(describing: error.localizedDescription))
//            }
//        }.resume()
//    }
}
