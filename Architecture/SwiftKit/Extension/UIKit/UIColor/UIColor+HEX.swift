//
//  UIColor+Hex.swift
//  SwiftKit
//
//  Created by Jivan on 2022/5/17.
//

#if canImport(UIKit)
import UIKit

public extension UIColor {
    /// 十六进制字符串设置颜色
    convenience init?(hexString: String, alpha: CGFloat = 1.0) {
        let color = Self.hexStringToColorRGB(hexString: hexString)
        guard let r = color.r, let g = color.g, let b = color.b else {
            #if DEBUG
                assertionFailure("不是十六进制值!")
            #endif
            return nil
        }
        self.init(r: r, g: g, b: b, alpha: alpha)
    }

    /// 十六进制 Int 设置颜色
    convenience init(hexInt: Int, alpha: CGFloat = 1.0) {
        let color = Self.hexIntToColorRGB(hexInt: hexInt)
        self.init(r: color.r, g: color.g, b: color.b, alpha: alpha)
    }
}

public extension UIColor {
    /// 十六进制字符串设置颜色(方法)
    static func hexStringColor(hexString: String, alpha: CGFloat = 1.0) -> UIColor {
        return UIColor(hexString: hexString, alpha: alpha) ?? .white
    }

    /// 十六进制 Int 颜色的使用(方法)
    static func hexIntColor(hexInt: Int, alpha: CGFloat = 1) -> UIColor {
        return UIColor(hexInt: hexInt, alpha: alpha)
    }
}

#endif
