//
//  URL+Query.swift
//  SwiftKit
//
//  Created by Jivan on 2022/5/17.
//

import Foundation

public extension URL {
    var queryParameters: [URLQueryItem] {
        URLComponents(string: absoluteString)?.queryItems ?? [URLQueryItem]()
    }

    var queryParametersDictionary: [String: String] {
        var result = [String: String]()
        queryParameters.forEach { result[$0.name] = $0.value ?? "" }
        return result
    }

    func queryParameter(named name: String) -> URLQueryItem? {
        queryParameters.first { $0.isNamed(name) }
    }

    func setQueryParameter(name: String, value: String, urlEncode: Bool = false) -> URL? {
        guard let urlString = absoluteString.components(separatedBy: "?").first else { return self }
        let param = queryParameter(named: name)
        let name = param?.name ?? name
        var dictionary = queryParametersDictionary
        dictionary[name] = urlEncode ? value.urlEncoded() : value
        return URL(string: "\(urlString)?\(dictionary.queryString)")
    }

    func setQueryParameters(_ dict: [String: String], urlEncode: Bool = true) -> URL? {
        var result = self
        dict.forEach {
            result = result.setQueryParameter(name: $0, value: $1) ?? result
        }
        return result
    }
}

private extension URLQueryItem {
    func isNamed(_ name: String) -> Bool {
        self.name.lowercased() == name.lowercased()
    }
}

private extension String {
    func urlEncoded() -> String? {
        addingPercentEncoding(withAllowedCharacters: .urlPathAllowed)?
            .replacingOccurrences(of: "&", with: "%26")
            .replacingOccurrences(of: "+", with: "%2B")
    }
}

private extension Dictionary where Key == String, Value == String {
    var queryString: String {
        let parameters = map { "\($0)=\($1)" }
        return parameters.joined(separator: "&")
    }
}
