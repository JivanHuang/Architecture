//
//  UITextView+Chain.swift
//  Architecture
//
//  Created by Jivan on 2022/9/15.
//

#if canImport(UIKit) && !os(watchOS)

import UIKit

public extension UITextView {
    /// 设置文字
    @discardableResult
    func text(_ string: String) -> Self {
        text = string
        return self
    }

    /// 设置富文本
    @discardableResult
    func attributedText(_ attributedString: NSAttributedString) -> Self {
        attributedText = attributedString
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

    /// 设置文本能否编辑
    @discardableResult
    func editable(_ editable: Bool) -> Self {
        isEditable = editable
        return self
    }

    /// 设置文本能否选择
    @discardableResult
    func slectable(_ slectable: Bool) -> Self {
        isSelectable = slectable
        return self
    }

    /// 设置文本对齐方式
    @discardableResult
    func textAlignment(_ alignment: NSTextAlignment) -> Self {
        textAlignment = alignment
        return self
    }

    /// 设置代理
    @discardableResult
    func delegate(_ delegate: UITextViewDelegate) -> Self {
        self.delegate = delegate
        return self
    }
}

#endif
