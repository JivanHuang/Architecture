//
//  Collection+Async.swift
//  SwiftKit
//
//  Created by Jivan on 2022/5/17.
//

import Foundation

@available(iOS 15.0, macOS 12.0, watchOS 8.0, tvOS 15.0, *)
public extension Collection {
    /// 使用异步转换对集合进行压缩映射。
    func asyncCompactMap<ResultType>(_ transform: (Element) async -> ResultType?) async -> [ResultType] {
        await self
            .asyncMap(transform)
            .compactMap { $0 }
    }
    
    /// 使用异步转换对集合进行压缩映射。
    func asyncCompactMap<ResultType>(_ transform: (Element) async throws -> ResultType?) async throws -> [ResultType] {
        try await self
            .asyncMap(transform)
            .compactMap { $0 }
    }
    
    /// 使用异步转换对集合进行压缩映射。
    func asyncMap<ResultType>(_ transform: (Element) async -> ResultType) async -> [ResultType] {
        var result = [ResultType]()
        for item in self {
            await result.append(transform(item))
        }
        return result
    }
    
    /// 使用异步转换对集合进行压缩映射。
    func asyncMap<ResultType>(_ transform: (Element) async throws -> ResultType) async throws -> [ResultType] {
        var result = [ResultType]()
        for item in self {
            try await result.append(transform(item))
        }
        return result
    }
}
