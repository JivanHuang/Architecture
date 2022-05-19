//
//  UserDefaults+Codable.swift
//  SwiftKit
//
//  Created by Jivan on 2022/5/17.
//

import Foundation

public extension UserDefaults {
    func codable<T: Codable>(forKey key: String) -> T? {
        guard let data = object(forKey: key) as? Data else { return nil }
        let value = try? JSONDecoder().decode(T.self, from: data)
        return value
    }

    func setCodable<T: Codable>(_ codable: T, forKey key: String) {
        let data = try? JSONEncoder().encode(codable)
        set(data, forKey: key)
    }
}
