//
//  UIView+Chain.swift
//  SwiftKit
//
//  Created by Jivan on 2022/5/17.
//

import UIKit

public extension UIView {
    /// 设置 tag 值
    @discardableResult
    func tag(_ tag: Int) -> Self {
        self.tag = tag
        return self
    }

    /// 设置圆角
    @discardableResult
    func corner(_ cornerRadius: CGFloat) -> Self {
        layer.cornerRadius = cornerRadius
        layer.masksToBounds = true
        return self
    }

    /// 图片的模式
    @discardableResult
    func contentMode(_ mode: UIView.ContentMode) -> Self {
        contentMode = mode
        return self
    }

    /// 设置背景色
    @discardableResult
    func backgroundColor(_ color: UIColor) -> Self {
        backgroundColor = color
        return self
    }

    /// 设置十六进制颜色
    @discardableResult
    func backgroundColor(_ hex: String) -> Self {
        backgroundColor = UIColor.hexStringColor(hexString: hex)
        return self
    }

    /// 设置 frame
    @discardableResult
    func frame(_ frame: CGRect) -> Self {
        self.frame = frame
        return self
    }

    /// 被添加到某个视图上
    @discardableResult
    func addTo(_ superView: UIView) -> Self {
        superView.addSubview(self)
        return self
    }

    /// 设置是否支持触摸
    @discardableResult
    func isUserInteractionEnabled(_ isUserInteractionEnabled: Bool) -> Self {
        self.isUserInteractionEnabled = isUserInteractionEnabled
        return self
    }

    /// 设置是否隐藏
    @discardableResult
    func isHidden(_ isHidden: Bool) -> Self {
        self.isHidden = isHidden
        return self
    }

    /// 设置透明度
    @discardableResult
    func alpha(_ alpha: CGFloat) -> Self {
        self.alpha = alpha
        return self
    }

    /// 设置tintColor
    @discardableResult
    func tintColor(_ tintColor: UIColor) -> Self {
        self.tintColor = tintColor
        return self
    }

    /// 设置autoresizingMask
    @discardableResult
    func autoresizingMask(_ autoresizingMask: Bool) -> Self {
        translatesAutoresizingMaskIntoConstraints = autoresizingMask
        return self
    }
}
