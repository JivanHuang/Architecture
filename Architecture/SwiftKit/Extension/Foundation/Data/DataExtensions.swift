//
//  DataExtensions.swift
//  Architecture
//
//  Created by Jivan on 2022/9/23.
//

#if canImport(Foundation)
import Foundation

// MARK: - Properties
public extension Data {
   
    var bytes: [UInt8] {
        return [UInt8](self)
    }
}

// MARK: - Methods
public extension Data {
  
    func string(encoding: String.Encoding) -> String? {
        return String(data: self, encoding: encoding)
    }

    func jsonObject(options: JSONSerialization.ReadingOptions = []) throws -> Any {
        return try JSONSerialization.jsonObject(with: self, options: options)
    }
}

#endif
