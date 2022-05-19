//
//  String+Subscript.swift
//  SwiftKit
//
//  Created by Jivan on 2022/5/17.
//

import Foundation

public extension String {
    subscript(integerIndex: Int) -> Character {
        self[index(startIndex, offsetBy: integerIndex)]
    }

    subscript(integerRange: Range<Int>) -> String {
        let start = index(startIndex, offsetBy: integerRange.lowerBound)
        let end = index(startIndex, offsetBy: integerRange.upperBound)
        return String(self[start ..< end])
    }
}
