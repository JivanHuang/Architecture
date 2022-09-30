//
//  Array+Subscript.swift
//  SwiftKit
//
//  Created by Jivan on 2022/5/17.
//

public extension Array {
    subscript(safe index: Int) -> Element? {
        indices.contains(index) ? self[index] : nil
    }
}
