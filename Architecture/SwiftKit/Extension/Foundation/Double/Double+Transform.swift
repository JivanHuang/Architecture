//
//  Double+Transform.swift
//  SwiftKit
//
//  Created by Jivan on 2022/5/18.
//

#if canImport(Foundation)
import Foundation

public extension Double {
    /// 转化为货币字符串
    var formattedPrice: String {
        let formatter = SKNumberFormatter.shared
        formatter.numberStyle = .currency
        formatter.locale = .current
        return formatter.string(from: self as NSNumber)!
    }
}
#endif
