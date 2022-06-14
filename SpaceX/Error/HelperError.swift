//
//  HelperError.swift
//  SpaceX
//
//  Created by Emil Shpeklord on 04.05.2022.
//

import Foundation

enum HelperError: Error {
    case decodingError
    case notFound
    case unexpected(code: Int)
}

extension HelperError: CustomStringConvertible {
    public var description: String {
        switch self {
        case .decodingError:
            return "JSON is damaged."
        case .notFound:
            return "No connection to server."
        case .unexpected:
            return "An unexpected error occurred."
        }
    }
}