//
//  UIColor+Transform.swift
//  SwiftKit
//
//  Created by Jivan on 2022/5/17.
//

import UIKit

public extension UIColor {
    /// 根据颜色设置透明度返回新颜色
    convenience init(_ color: UIColor, alpha: CGFloat) {
        var red: CGFloat = 0.0
        var green: CGFloat = 0.0
        var blue: CGFloat = 0.0
        var oldAlpha: CGFloat = 0.0

        let success = color.getRed(&red, green: &green, blue: &blue, alpha: &oldAlpha)
        if success {
            self.init(red: red, green: green, blue: blue, alpha: alpha)
        } else {
            self.init(red: red, green: green, blue: blue, alpha: oldAlpha)
        }
    }
}
