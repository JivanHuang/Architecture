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
        // imageView的宽高
        let image = self.image(for: self.isSelected ? .selected : .normal)
        let imageWidth = image?.size.width ?? 0.0
        let imageHeight = image?.size.height ?? 0.0

        // titleLabel的宽高
        let title = self.title(for: self.isSelected ? .selected : .normal)
        let labelHeight = self.titleLabel?.font.lineHeight ?? 0.0
        let labelWidth = title?.boundingWidth(height: labelHeight, attributes: [NSAttributedString.Key.font: self.titleLabel?.font as Any]) ?? 0.0

        // 初始化imageEdgeInsets和labelEdgeInsets
        var imageEdgeInsets = UIEdgeInsets.zero
        var labelEdgeInsets = UIEdgeInsets.zero

        // 根据style和space得到imageEdgeInsets和labelEdgeInsets的值
        switch type {
        case .top:
            imageEdgeInsets = UIEdgeInsets(top: -(labelHeight + spacing), left: 0, bottom: 0, right: -labelWidth)
            labelEdgeInsets = UIEdgeInsets(top: 0, left: -imageWidth, bottom: -imageHeight - spacing, right: 0)
        case .left:
            imageEdgeInsets = UIEdgeInsets(top: 0, left: -spacing, bottom: 0, right: spacing)
            labelEdgeInsets = UIEdgeInsets(top: 0, left: spacing, bottom: 0, right: -spacing)
        case .bottom:
            imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: -(labelHeight + spacing), right: -labelWidth)
            labelEdgeInsets = UIEdgeInsets(top: -(imageHeight + spacing), left: -imageWidth, bottom: 0, right: 0)
        case .right:
            imageEdgeInsets = UIEdgeInsets(top: 0, left: labelWidth + spacing, bottom: 0, right: -(labelWidth + spacing))
            labelEdgeInsets = UIEdgeInsets(top: 0, left: -(imageWidth + spacing), bottom: 0, right: imageWidth + spacing)
        }
        self.titleEdgeInsets = labelEdgeInsets
        self.imageEdgeInsets = imageEdgeInsets
        return self
    }
}
#endif

