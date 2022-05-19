//
//  Int+Transform.swift
//  SwiftKit
//
//  Created by Jivan on 2022/5/18.
//

import Foundation

public extension Int {
    /// 转化为货币字符串
    var formattedPrice: String {
        let formatter = SKNumberFormatter.shared
        formatter.numberStyle = .currency
        formatter.locale = .current
        return formatter.string(from: self as NSNumber)!
    }

    var float: Float {
        Float(self)
    }

    var double: Double {
        Double(self)
    }
}
