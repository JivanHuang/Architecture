//
//  MutableCollectionExtension.swift
//  SwiftyUtils
//
//  Created by Jivan on 14/06/2020.
//  Copyright © 2020 Jivan. All rights reserved.
//

import Foundation

// MARK: - KeyPath

public extension MutableCollection where Self: RandomAccessCollection {
    /// Sorts the mutable collection in place using `KeyPath`.
    /// - Parameters:
    ///   - keyPath: The `keyPath` that will be used to do the sort.
    ///   - order: The sort order that will be applied. Default value is `<`.
    mutating func sort<T: Comparable>(by keyPath: KeyPath<Element, T>, order: (T, T) -> Bool = (<)) {
        sort {
            order($0[keyPath: keyPath], $1[keyPath: keyPath])
        }
    }
}
