//
//  URLExtension.swift
//  Architecture
//
//  Created by Jivan on 2021/8/23.
//

import Foundation

// MARK: - Query

public extension URL {
    // disable discouraged_optional_collection
    /// Extract the query items from an URL.
    /// - Returns: A dictionary containing all the query items found. If no items found then it will return nil.
    var queryParameters: [String: String]? {
        guard let components = URLComponents(url: self as URL, resolvingAgainstBaseURL: true),
              let queryItems = components.queryItems
        else {
            return nil
        }

        var parameters = [String: String]()
        queryItems.forEach {
            parameters[$0.name] = $0.value
        }
        return parameters
    }

    ///  add query items for an URL.
    /// - Parameter parameters query items
    /// - Returns: URL

    func appendingQueryParameters(_ parameters: [String: String]) -> URL {
        var urlComponents = URLComponents(url: self, resolvingAgainstBaseURL: true)!
        var items = urlComponents.queryItems ?? []
        items += parameters.map { URLQueryItem(name: $0, value: $1) }
        urlComponents.queryItems = items
        return urlComponents.url!
    }

    /// add query items for an URL
    /// - Parameter  parameters  query items
    mutating func appendQueryParameters(_ parameters: [String: String]) {
        self = appendingQueryParameters(parameters)
    }
}
