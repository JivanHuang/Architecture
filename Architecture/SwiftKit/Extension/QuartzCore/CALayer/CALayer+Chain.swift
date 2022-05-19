//
//  CALayer+Chain.swift
//  SwiftKit
//
//  Created by Jivan on 2022/5/17.
//

import UIKit

public extension CALayer {
    /// 设置圆角
    @discardableResult
    func corner(_ radius: CGFloat) -> Self {
        cornerRadius = radius
        return self
    }
    
    /// 设置背景色
    @discardableResult
    func backgroundColor(_ color: UIColor) -> Self {
        backgroundColor = color.cgColor
        return self
    }
    
    /// 设置背景色 (十六进制字符串)
    @discardableResult
    func backgroundColor(_ hex: String) -> Self {
        backgroundColor = UIColor.hexStringColor(hexString: hex).cgColor
        return self
    }
    
    /// 设置frame
    @discardableResult
    func frame(_ frame: CGRect) -> Self {
        self.frame = frame
        return self
    }
    
    /// 添加到父视图
    @discardableResult
    func addTo(_ superView: UIView) -> Self {
        superView.layer.addSublayer(self)
        return self
    }
    
    /// 添加到父视图(CALayer)
    @discardableResult
    func addTo(_ superLayer: CALayer) -> Self {
        superLayer.addSublayer(self)
        return self
    }
    
    /// 是否隐藏
    @discardableResult
    func isHidden(_ isHidden: Bool) -> Self {
        self.isHidden = isHidden
        return self
    }
    
    /// 设置边框宽度
    @discardableResult
    func borderWidth(_ width: CGFloat) -> Self {
        borderWidth = width
        return self
    }
    
    /// 设置边框颜色
    @discardableResult
    func borderColor(_ color: UIColor) -> Self {
        borderColor = color.cgColor
        return self
    }
    
    /// 是否开启光栅化
    @discardableResult
    func shouldRasterize(_ rasterize: Bool) -> Self {
        shouldRasterize = rasterize
        return self
    }
    
    /// 设置光栅化比例
    @discardableResult
    func rasterizationScale(_ scale: CGFloat) -> Self {
        rasterizationScale = scale
        shouldRasterize = true
        return self
    }
    
    /// 设置阴影颜色
    @discardableResult
    func shadowColor(_ color: UIColor) -> Self {
        shadowColor = color.cgColor
        return self
    }
    
    /// 设置阴影的透明度，取值范围：0.0~1.0
    func shadowOpacity(_ opacity: Float) -> Self {
        shadowOpacity = opacity
        return self
    }
    
    /// 设置阴影的偏移量
    @discardableResult
    func shadowOffset(_ offset: CGSize) -> Self {
        shadowOffset = offset
        return self
    }
    
    /// 设置阴影圆角
    @discardableResult
    func shadowRadius(_ radius: CGFloat) -> Self {
        shadowRadius = radius
        return self
    }
    
    /// 高性能添加阴影路径 Shadow
    @discardableResult
    func shadowPath(_ path: CGPath) -> Self {
        shadowPath = path
        return self
    }
}
