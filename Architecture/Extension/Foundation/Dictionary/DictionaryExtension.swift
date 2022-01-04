//
//  Created by Jivan on 24/04/21.
//  Copyright Jivan. All rights reserved.
//

import Foundation

// MARK: - Helpers

public extension Dictionary {
    /// Check if the Dictionary contains a specified key
    /// - Parameter key: The key to check.
    /// - Returns: true if the key is in the dictionary, otherwise false.
    func has(key: Key) -> Bool {
        index(forKey: key) != nil
    }
}

// MARK: - Data

public extension Dictionary {
    /// Data from dictionary
    /// - Parameter options: `JSONSerialization.WritingOptions`
    /// - Returns: `Data?`
    func toData(options: JSONSerialization.WritingOptions = []) throws -> Data? {
        let data = try JSONSerialization.data(withJSONObject: self, options: options)
        return data
    }
}

// MARK: - Transform

public extension Dictionary {
    /// Add each Dictionary's unique key-value in this one.
    /// - Parameter values: all the dictionaries that will be added to this one.
    /// - Returns: A Dictionary containing all the keys-values of this Dictionary
    ///            plus all the unique ones from the others array.
    func union(values: Dictionary...) -> Dictionary {
        var result = self
        values.forEach { dictionary in
            dictionary.forEach { key, value in
                result[key] = value
            }
        }
        return result
    }

    /// Merge all the dictionaries into this one.
    /// - Parameter dictionaries: all the dictionaries to merge into this one.
    mutating func merge<K, V>(with dictionaries: [K: V]...) {
        dictionaries.forEach {
            for (key, value) in $0 {
                guard let value = value as? Value, let key = key as? Key else {
                    continue
                }

                self[key] = value
            }
        }
    }
}

// MARK: - Equatable Transform

public extension Dictionary where Value: Equatable {
    /// Calculate all the differences between this Dictionary and others.
    /// - Parameter dictionaries: All the dictionaries that will be compared with the current one.
    /// - Returns: A Dictionary containing all the difference between this one and the others.
    func difference(with dictionaries: [Key: Value]...) -> [Key: Value] {
        var result = self
        dictionaries.forEach {
            for (key, value) in $0 {
                if result.has(key: key), result[key] == value {
                    result[key] = nil
                }
            }
        }
        return result
    }
}
