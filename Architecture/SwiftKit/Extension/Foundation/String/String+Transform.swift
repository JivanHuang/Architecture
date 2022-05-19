//
//  String+Transform.swift
//  SwiftKit
//
//  Created by Jivan on 2022/5/17.
//

import Foundation

public extension String {
    func trimmed() -> String {
        components(separatedBy: NSCharacterSet.whitespacesAndNewlines).joined()
    }

    func truncated(limit: Int) -> String {
        if count > limit {
            var truncatedString = self[0 ..< limit]
            truncatedString = truncatedString.appending("...")
            return truncatedString
        }
        return self
    }
}
