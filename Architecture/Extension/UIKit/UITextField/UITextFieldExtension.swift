//
//  UITextFieldExtension.swift
//  Architecture
//
//  Created by Jivan on 2021/8/19.
//

import UIKit

// MARK: 基本的扩展

public extension UITextField {
    /// 判断的方式
    enum textFieldValidationOptions: Int {
        // 等于(=)
        case equalTo
        // 大于(>)
        case greaterThan
        // 大于等于(>=)
        case greaterThanOrEqualTo
        // 小于(<)
        case lessThan
        // 小于等于(<=)
        case lessThanOrEqualTo
    }

    /// 验证UITextField中字符长度
    @discardableResult
    func validateLength(ofCount count: Int, option: UITextField.textFieldValidationOptions) -> Bool {
        switch option {
        case .equalTo:
            return text!.count == count
        case .greaterThan:
            return text!.count > count
        case .greaterThanOrEqualTo:
            return text!.count >= count
        case .lessThan:
            return text!.count < count
        case .lessThanOrEqualTo:
            return text!.count <= count
        }
    }

    /// 是否都是数字
    func validateDigits() -> Bool {
        let digitsRegEx = "[0-9]*"
        let digitsTest = NSPredicate(format: "SELF MATCHES %@", digitsRegEx)
        return digitsTest.evaluate(with: text)
    }

    /// 设置富文本的占位符
    func setPlaceholderAttribute(font: UIFont, color: UIColor = .black) {
        let arrStr = NSMutableAttributedString(string: placeholder ?? "", attributes: [NSAttributedString.Key.foregroundColor: color, NSAttributedString.Key.font: font])
        attributedPlaceholder = arrStr
    }
}

// MARK: 链式编程

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
