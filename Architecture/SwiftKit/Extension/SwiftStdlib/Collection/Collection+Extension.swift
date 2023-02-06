//
//  Collection+Extension.swift
//  Architecture
//
//  Created by Jivan on 2023/1/6.
//  Copyright © 2023 柒贰互娱. All rights reserved.
//

#if canImport(Dispatch)
import Dispatch
#endif

// MARK: - Properties

public extension Collection {
    var fullRange: Range<Index> { startIndex..<endIndex }
}

// MARK: - Methods

public extension Collection {
    #if canImport(Dispatch)

    func forEachInParallel(_ each: (Self.Element) -> Void) {
        DispatchQueue.concurrentPerform(iterations: count) {
            each(self[index(startIndex, offsetBy: $0)])
        }
    }
    #endif

    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }

    func group(by size: Int) -> [[Element]]? {
        // Inspired by: https://lodash.com/docs/4.17.4#chunk
        guard size > 0, !isEmpty else { return nil }
        var start = startIndex
        var slices = [[Element]]()
        while start != endIndex {
            let end = index(start, offsetBy: size, limitedBy: endIndex) ?? endIndex
            slices.append(Array(self[start..<end]))
            start = end
        }
        return slices
    }

    func indices(where condition: (Element) throws -> Bool) rethrows -> [Index]? {
        let indices = try self.indices.filter { try condition(self[$0]) }
        return indices.isEmpty ? nil : indices
    }

    func forEach(slice: Int, body: ([Element]) throws -> Void) rethrows {
        var start = startIndex
        while case let end = index(start, offsetBy: slice, limitedBy: endIndex) ?? endIndex,
              start != end
        {
            try body(Array(self[start..<end]))
            start = end
        }
    }
}

// MARK: - Methods (Equatable)

public extension Collection where Element: Equatable {
    func indices(of item: Element) -> [Index] {
        return indices.filter { self[$0] == item }
    }
}
