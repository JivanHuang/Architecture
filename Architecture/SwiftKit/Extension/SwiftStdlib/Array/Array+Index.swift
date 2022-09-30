//
//  Array+Index.swift
//  SwiftKit
//
//  Created by Jivan on 2022/5/17.
//

public extension Array where Element: Equatable {
    func indexes(of item: Element) -> [Int] {
        var indexes = [Int]()
        for index in 0 ..< count where self[index] == item {
            indexes.append(index)
        }
        return indexes
    }

    func firstIndex(of item: Element) -> Int? {
        for (index, value) in lazy.enumerated() where value == item {
            return index
        }
        return nil
    }

    func lastIndex(of item: Element) -> Int? {
        indexes(of: item).last
    }
}
