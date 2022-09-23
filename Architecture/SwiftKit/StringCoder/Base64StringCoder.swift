//
//  Base64StringCoder.swift
//  SwiftKit
//
//  Created by Jivan on 2022/5/17.
//

#if canImport(Foundation)
import Foundation

public class Base64StringCoder: StringCoder {
    public init() {}

    public func decode(_ string: String) -> String? {
        guard let data = Data(base64Encoded: string, options: .ignoreUnknownCharacters) else { return nil }
        return String(data: data, encoding: .utf8)
    }

    public func encode(_ string: String) -> String? {
        let data = string.data(using: .utf8)
        let encoded = data?.base64EncodedData(options: .endLineWithLineFeed)
        guard let encodedData = encoded else { return nil }
        return String(data: encodedData, encoding: .utf8)
    }
}
#endif
