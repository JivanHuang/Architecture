//
//  UILabelExtension.swift
//  Architecture
//
//  Created by Jivan on 2021/8/19.
//

import UIKit

// MARK: 链式编程

public extension UILabel {
    /// 设置文字
    @discardableResult
    func text(_ text: String) -> Self {
        self.text = text
        return self
    }

    /// 设置文字行数
    @discardableResult
    func line(_ number: Int) -> Self {
        numberOfLines = number
        return self
    }

    /// 设置文字对齐方式
    @discardableResult
    func textAlignment(_ alignment: NSTextAlignment) -> Self {
        textAlignment = alignment
        return self
    }

    /// 设置富文本文字
    @discardableResult
    func attributedText(_ attributedText: NSAttributedString) -> Self {
        self.attributedText = attributedText
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

    /// 设置字体的大小
    @discardableResult
    func font(_ font: UIFont) -> Self {
        self.font = font
        return self
    }

    /// 设置字体的大小
    @discardableResult
    func font(_ fontSize: CGFloat) -> Self {
        font = UIFont.systemFont(ofSize: fontSize)
        return self
    }

    /// 设置字体的大小（粗体）
    @discardableResult
    func boldFont(_ fontSize: CGFloat) -> Self {
        font = UIFont.boldSystemFont(ofSize: fontSize)
        return self
    }
}
