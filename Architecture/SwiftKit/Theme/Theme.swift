//
//  Theme.swift
//  SwiftKit
//
//  Created by Jivan on 2022/5/18.
//

import Foundation
import UIKit

public enum Theme {}

// 颜色
public extension Theme {
    /// 重度黑色文字颜色
    static let heavyBlackTextColor = UIColor(hexInt: 0x333333)
    /// 中度黑色文字颜色
    static let mediumBlackTextColor = UIColor(hexInt: 0x666666)
    /// 轻度黑色文字颜色
    static let lightBlackText = UIColor(hexInt: 0x999999)
}

// 字体
public extension Theme {
    static func lightFont(_ fontSize: CGFloat) -> UIFont {
        UIFont.systemFont(ofSize: fontSize, weight: .light)
    }

    static func regularFont(_ fontSize: CGFloat) -> UIFont {
        UIFont.systemFont(ofSize: fontSize, weight: .regular)
    }

    static func mediumFont(_ fontSize: CGFloat) -> UIFont {
        UIFont.systemFont(ofSize: fontSize, weight: .medium)
    }

    static func boldFont(_ fontSize: CGFloat) -> UIFont {
        UIFont.systemFont(ofSize: fontSize, weight: .bold)
    }

    static func heavyFont(_ fontSize: CGFloat) -> UIFont {
        UIFont.systemFont(ofSize: fontSize, weight: .heavy)
    }
}

// 自动适应屏幕宽度字体
public extension Theme {
    static func lightAutoFont(_ fontSize: CGFloat) -> UIFont {
        UIFont.systemFont(ofSize: fontSize * UIScreen.main.ratio, weight: .light)
    }

    static func regularAutoFont(_ fontSize: CGFloat) -> UIFont {
        UIFont.systemFont(ofSize: fontSize * UIScreen.main.ratio, weight: .regular)
    }

    static func mediumAutoFont(_ fontSize: CGFloat) -> UIFont {
        UIFont.systemFont(ofSize: fontSize * UIScreen.main.ratio, weight: .medium)
    }

    static func boldAutoFont(_ fontSize: CGFloat) -> UIFont {
        UIFont.systemFont(ofSize: fontSize * UIScreen.main.ratio, weight: .bold)
    }

    static func heavyAutoFont(_ fontSize: CGFloat) -> UIFont {
        UIFont.systemFont(ofSize: fontSize * UIScreen.main.ratio, weight: .heavy)
    }
}
