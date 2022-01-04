//
//  Theme.swift
//  Architecture
//
//  Created by Jivan on 2021/8/20.
//

import UIKit

public extension UIColor {
    /// 重度黑字体颜色
    static let heavyText = UIColor(hexInt: 333333)
    /// 中度黑字体颜色
    static let mediumText = UIColor(hexInt: 666666)
    /// 轻度黑字体颜色
    static let lightText = UIColor(hexInt: 999999)
}

public extension UIFont {
    static func boldFont(_ ofSie: CGFloat) -> UIFont {
        UIFont.systemFont(ofSize: autoWidth(ofSie), weight: .bold)
    }

    static func regularFont(_ ofSie: CGFloat) -> UIFont {
        UIFont.systemFont(ofSize: autoWidth(ofSie), weight: .regular)
    }

    static func font(_ ofSie: CGFloat, _ weight: Weight) -> UIFont {
        UIFont.systemFont(ofSize: autoWidth(ofSie), weight: weight)
    }
}
