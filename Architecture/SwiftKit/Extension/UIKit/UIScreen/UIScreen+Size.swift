//
//  UIScreen+Size.swift
//  SwiftKit
//
//  Created by Jivan on 2022/5/16.
//

import UIKit

public extension UIScreen {
    /// 状态栏高度
    var statusBarHeight: CGFloat {
        if #available(iOS 13.0, *) {
            for scene in UIApplication.shared.connectedScenes {
                if let scene = scene as? UIWindowScene, scene.activationState == .foregroundActive {
                    guard let statusBarManager = scene.statusBarManager else { return 20.0 }
                    return statusBarManager.statusBarFrame.size.height
                }
            }
        } else {
            return UIApplication.shared.statusBarFrame.size.height
        }
        return 20.0
    }

    /// 导航栏高度
    var navigationBarHeight: CGFloat { 44.0 }

    /// 导航栏+状态栏高度
    var topHeight: CGFloat { statusBarHeight + navigationBarHeight }

    /// homeIndicator 高度
    var homeIndicatorHeight: CGFloat {
        guard let keyWindow = UIApplication.shared.window else { return 0.0 }
        return keyWindow.safeAreaInsets.bottom
    }

    /// tabBar 高度
    var tabBarHeight: CGFloat { 49.0 }

    /// tabBar+homeIndicator 高度
    var bottomHeight: CGFloat { tabBarHeight + homeIndicatorHeight }

    /// 屏幕高度
    var height: CGFloat { UIScreen.main.bounds.size.height }

    /// 屏幕宽度
    var width: CGFloat { UIScreen.main.bounds.size.width }

    /// 屏幕宽度与设计图尺寸比例
    var ratio: CGFloat { CGFloat(ceilf(Float(UIScreen.main.width / 375.0))) }

    /// 单个像素
    var kOnexPixel: CGFloat { 1 / UIScreen.main.scale }
}
