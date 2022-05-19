//
//  UIApplication+keyWindow.swift
//  SwiftKit
//
//  Created by Jivan on 2022/5/16.
//

import UIKit

public extension UIApplication {
    /// 获取当前的keywindow
    var window: UIWindow? {
        if #available(iOS 13.0, *) {
            for scene in UIApplication.shared.connectedScenes {
                if let scene = scene as? UIWindowScene, scene.activationState == .foregroundActive {
                    for window in scene.windows {
                        if window.isKeyWindow {
                            return window
                        }
                    }
                }
            }
        } else {
            for window in UIApplication.shared.windows {
                if window.isKeyWindow {
                    return window
                }
            }
        }
        return nil
    }
}
