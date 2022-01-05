//
//  Theme.swift
//  Architecture
//
//  Created by Jivan on 2021/8/20.
//

import UIKit

public extension UIColor {
    /// 重度黑字体颜色
    static var heavyText: UIColor {
        UIColor(hexInt: 333333)
    }

    /// 中度黑字体颜色
    static var mediumText: UIColor {
        UIColor(hexInt: 666666)
    }

    /// 轻度黑字体颜色
    static var lightText: UIColor {
        UIColor(hexInt: 999999)
    }
}

public extension UIFont {
    static func bold(_ ofSie: CGFloat) -> UIFont {
        UIFont.systemFont(ofSize: autoWidth(ofSie), weight: .bold)
    }

    static func regular(_ ofSie: CGFloat) -> UIFont {
        UIFont.systemFont(ofSize: autoWidth(ofSie), weight: .regular)
    }

    static func font(_ ofSie: CGFloat, _ weight: Weight) -> UIFont {
        UIFont.systemFont(ofSize: autoWidth(ofSie), weight: weight)
    }
}
