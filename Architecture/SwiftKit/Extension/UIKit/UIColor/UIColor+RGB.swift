//
//  UIColor+RGB.swift
//  SwiftKit
//
//  Created by Jivan on 2022/5/17.
//

import UIKit

public extension UIColor {
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat, alpha: CGFloat = 1.0) {
        self.init(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: alpha)
    }
}

public extension UIColor {
    /// 根据RGBA的颜色
    static func color(r: CGFloat, g: CGFloat, b: CGFloat, alpha: CGFloat = 1.0) -> UIColor {
        return UIColor(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: alpha)
    }
}

public extension UIColor {
    /// 根据 十六进制字符串 颜色获取 RGB
    static func hexStringToColorRGB(hexString: String) -> (r: CGFloat?, g: CGFloat?, b: CGFloat?) {
        guard hexString.count >= 6 else { return (nil, nil, nil) }
        var cString: String = hexString.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if cString.hasPrefix("0x") || cString.hasPrefix("##") {
            cString = String(cString[cString.index(cString.startIndex, offsetBy: 2) ..< cString.endIndex])
        }
        if cString.hasPrefix("#") {
            cString = String(cString[cString.index(cString.startIndex, offsetBy: 1) ..< cString.endIndex])
        }

        var rgbValue: UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)
        let red = CGFloat((rgbValue & 0xFF0000) >> 16)
        let green = CGFloat((rgbValue & 0x00FF00) >> 8)
        let blue = CGFloat(rgbValue & 0x0000FF)
        return (red, green, blue)
    }

    /// 根据 十六进制值 颜色获取 RGB
    static func hexIntToColorRGB(hexInt: Int) -> (r: CGFloat, g: CGFloat, b: CGFloat) {
        let red = CGFloat(hexInt >> 16)
        let green = CGFloat((hexInt & 0xFF00) >> 8)
        let blue = CGFloat(hexInt & 0xFF)
        return (red, green, blue)
    }
}
