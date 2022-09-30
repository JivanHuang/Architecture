//
//  String+Transform.swift
//  SwiftKit
//
//  Created by Jivan on 2022/5/17.
//

#if canImport(Foundation)
import Foundation
#endif

public extension String {
    func truncated(limit: Int) -> String {
        if count > limit {
            var truncatedString = self[0 ..< limit]
            truncatedString = truncatedString.appending("...")
            return truncatedString
        }
        return self
    }

#if canImport(Foundation)
    func trimmed() -> String {
        components(separatedBy: NSCharacterSet.whitespacesAndNewlines).joined()
    }
#endif
}
