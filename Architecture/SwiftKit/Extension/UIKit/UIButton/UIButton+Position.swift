//
//  UIButton+Position.swift
//  Architecture
//
//  Created by Jivan on 2023/1/20.
//

#if canImport(UIKit)
import UIKit

public extension UIButton {
    enum ButtonImagePosition {
        case top // 图片在上，文字在下
        case bottom // 图片在下，文字在上
        case left // 图片在左，文字在右
        case right // 图片在右，文字在左
    }

    @discardableResult
    func imagePosition(type: ButtonImagePosition, spacing: CGFloat = 0.0) -> Self {
        // 得到imageView和titleLabel的宽高
        let imageWidth = self.imageView?.frame.size.width ?? 0.0
        let imageHeight = self.imageView?.frame.size.height ?? 0.0
        let labelWidth = self.titleLabel?.intrinsicContentSize.width ?? 0.0
        let labelHeight = self.titleLabel?.intrinsicContentSize.height ?? 0.0

        // 初始化imageEdgeInsets和labelEdgeInsets
        var imageEdgeInsets = UIEdgeInsets.zero
        var labelEdgeInsets = UIEdgeInsets.zero

        // 根据style和space得到imageEdgeInsets和labelEdgeInsets的值
        switch type {
        case .top:
            imageEdgeInsets = UIEdgeInsets(top: -labelHeight - spacing/2, left: 0, bottom: 0, right: -labelWidth)
            labelEdgeInsets = UIEdgeInsets(top: 0, left: -imageWidth, bottom: -imageHeight - spacing/2, right: 0)
        case .left:
            imageEdgeInsets = UIEdgeInsets(top: 0, left: -spacing/2, bottom: 0, right: spacing)
            labelEdgeInsets = UIEdgeInsets(top: 0, left: spacing/2, bottom: 0, right: -spacing/2)
        case .bottom:
            imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: -labelHeight - spacing/2, right: -labelWidth)
            labelEdgeInsets = UIEdgeInsets(top: -imageHeight - spacing/2, left: -imageWidth, bottom: 0, right: 0)
        case .right:
            imageEdgeInsets = UIEdgeInsets(top: 0, left: labelWidth + spacing/2, bottom: 0, right: -labelWidth - spacing/2)
            labelEdgeInsets = UIEdgeInsets(top: 0, left: -imageWidth - spacing/2, bottom: 0, right: imageWidth + spacing/2)
        }
        self.titleEdgeInsets = labelEdgeInsets
        self.imageEdgeInsets = imageEdgeInsets
        return self
    }
}
#endif
