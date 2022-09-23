//
//  UIDevice+Idiom.swift
//  SwiftKit
//
//  Created by Jivan on 2022/5/16.
//

#if canImport(UIKit)
import UIKit

public extension UIDevice {
    /// 判断设备是否为异形屏幕
    var isIphoneX: Bool {
        if self.userInterfaceIdiom != .phone {
            return false
        }
        guard let keyWindow = UIApplication.shared.window else { return false }
        if keyWindow.safeAreaInsets.bottom > 0.0 {
            return true
        }
        return false
    }
}
#endif
