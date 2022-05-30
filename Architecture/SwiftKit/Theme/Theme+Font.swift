//
//  Theme+Font.swift
//  Architecture
//
//  Created by Jivan on 2022/5/30.
//

import Foundation
import UIKit

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
        lightFont(fontSize * UIScreen.main.ratio)
    }
    
    static func regularAutoFont(_ fontSize: CGFloat) -> UIFont {
        regularFont(fontSize * UIScreen.main.ratio)
    }
    
    static func mediumAutoFont(_ fontSize: CGFloat) -> UIFont {
        mediumFont(fontSize * UIScreen.main.ratio)
    }
    
    static func boldAutoFont(_ fontSize: CGFloat) -> UIFont {
        boldFont(fontSize * UIScreen.main.ratio)
    }
    
    static func heavyAutoFont(_ fontSize: CGFloat) -> UIFont {
        heavyFont(fontSize * UIScreen.main.ratio)
    }
}
