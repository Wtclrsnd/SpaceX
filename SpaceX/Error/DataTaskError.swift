//
//  DataTaskError.swift
//  SpaceX
//
//  Created by Emil Shpeklord on 06.05.2022.
//

import Foundation

enum DataTaskError: Error {
    case incorrectJson
    case notFound
    case unexpected(code: Int)
}

extension DataTaskError: CustomStringConvertible {
    public var description: String {
        switch self {
        case .incorrectJson:
            return "JSON is damaged."
        case .notFound:
            return "No connection to server."
        case .unexpected:
            return "An unexpected error occurred."
        }
    }
}
