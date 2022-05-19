//
//  UITextField+Chain.swift
//  SwiftKit
//
//  Created by Jivan on 2022/5/17.
//

import UIKit

public extension UITextField {
    /// 设置文字
    @discardableResult
    func text(_ text: String) -> Self {
        self.text = text
        return self
    }

    /// 设置富文本
    @discardableResult
    func attributedText(_ attributedString: NSAttributedString) -> Self {
        attributedText = attributedString
        return self
    }

    /// 设置占位符
    @discardableResult
    func placeholder(_ text: String) -> Self {
        placeholder = text
        return self
    }

    /// 设置富文本占位符
    @discardableResult
    func attributedPlaceholder(_ text: NSAttributedString) -> Self {
        attributedPlaceholder = text
        return self
    }

    /// 设置文本格式
    @discardableResult
    func alignment(_ alignment: NSTextAlignment) -> Self {
        textAlignment = alignment
        return self
    }

    /// 设置文本颜色
    @discardableResult
    func color(_ color: UIColor) -> Self {
        textColor = color
        return self
    }

    /// 设置文本颜色（十六进制字符串）
    @discardableResult
    func color(_ hex: String) -> Self {
        textColor = UIColor.hexStringColor(hexString: hex)
        return self
    }

    /// 设置文本字体大小
    @discardableResult
    func font(_ font: UIFont) -> Self {
        self.font = font
        return self
    }

    /// 设置文本字体大小(CGFloat)
    @discardableResult
    func font(_ fontSize: CGFloat) -> Self {
        font = UIFont.systemFont(ofSize: fontSize)
        return self
    }

    /// 设置代理
    @discardableResult
    func delegate(_ delegate: UITextFieldDelegate) -> Self {
        self.delegate = delegate
        return self
    }
}
