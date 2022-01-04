//
//  Constant.swift
//  Architecture
//
//  Created by Jivan on 2021/8/18.
//

import UIKit

/// 状态栏高度
let statusBarHeight: CGFloat = UIDevice.current.isIphoneXSeries ? 44.0 : 20.0
/// 导航栏高度
let navigationBarHeight: CGFloat = 44.0
/// 导航栏+状态栏高度
let topHeight: CGFloat = statusBarHeight + navigationBarHeight
/// homeIndicator 高度
let homeIndicatorHeight: CGFloat = UIDevice.current.isIphoneXSeries ? 34.0 : 0.0
/// tabBar 高度
let tabBarHeight: CGFloat = 49.0
/// tabBar+homeIndicator 高度
let bottomHeight = CGFloat(homeIndicatorHeight + 49.0)
/// 屏幕高度
let screenHeight: CGFloat = UIScreen.main.bounds.size.height
/// 屏幕宽度
let screenWidth: CGFloat = UIScreen.main.bounds.size.width
/// 屏幕宽度比例
let screenWidthScale: CGFloat = UIScreen.main.bounds.size.width / 375.f
/// 1个像素
let kOnexPixel = 1 / UIScreen.main.scale

/// 自动宽度
func autoWidth(_ width: CGFloat) -> CGFloat {
    return ceil(width * screenWidthScale)
}
