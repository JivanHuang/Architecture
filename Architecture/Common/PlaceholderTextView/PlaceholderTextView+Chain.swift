//
//  PlaceholderTextView+Chain.swift
//  Architecture
//
//  Created by Jivan on 2022/9/15.
//

import UIKit

public extension PlaceholderTextView {
    /// 设置占位文字
    @discardableResult
    func placeholder(_ string: String) -> Self {
        placeholder = string
        return self
    }

    /// 设置占位文字颜色
    @discardableResult
    func placeholderColor(_ color: UIColor) -> Self {
        placeholderColor = color
        return self
    }

    /// 设置文本颜色（十六进制字符串）
    @discardableResult
    func placeholderColor(_ hex: String) -> Self {
        placeholderColor = UIColor.hexStringColor(hexString: hex)
        return self
    }
}
