//
//  UserDefaultsExtesnion.swift
//  Architecture
//
//  Created by Jivan on 2021/8/19.
//

import Foundation

// MARK: 基本的扩展

public extension UserDefaults {
    /// 存值
    @discardableResult
    static func userDefaultsSetValue(value: Any?, key: String?) -> Bool {
        guard value != nil, key != nil else {
            return false
        }
        standard.set(value, forKey: key!)
        standard.synchronize()
        return true
    }

    /// 取值
    static func userDefaultsGetValue(key: String?) -> Any? {
        guard key != nil, let result = Self.standard.value(forKey: key!) else {
            return nil
        }
        return result
    }
}

// MARK: 模型持久化

public extension UserDefaults {
    /// 存储模型
    static func setItem<T: Decodable & Encodable>(_ object: T, forKey key: String) {
        let encoder = JSONEncoder()
        guard let encoded = try? encoder.encode(object) else {
            return
        }
        standard.set(encoded, forKey: key)
        standard.synchronize()
    }

    /// 取出模型
    static func getItem<T: Decodable & Encodable>(_ type: T.Type, forKey key: String) -> T? {
        guard let data = Self.standard.data(forKey: key) else {
            return nil
        }
        let decoder = JSONDecoder()
        guard let object = try? decoder.decode(type, from: data) else {
            debugPrint("Couldnt find key")
            return nil
        }
        return object
    }

    static func deleteItem(forKey key: String) {
        if Self.standard.data(forKey: key) == nil {
            return
        }
        Self.standard.removeObject(forKey: key)
        standard.synchronize()
    }
}
