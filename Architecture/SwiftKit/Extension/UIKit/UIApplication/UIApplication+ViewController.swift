//
//  UIApplication+topViewController.swift
//  SwiftKit
//
//  Created by Jivan on 2022/5/16.
//

import UIKit

public extension UIApplication {
    /// 获取当前正在显示的viewcontroller
    func topViewController(from viewcontroller: UIViewController? = UIApplication.shared.window?.rootViewController)
        -> UIViewController?
    {
        guard let viewcontroller = viewcontroller else {
            return nil
        }
        if let navigationController = viewcontroller as? UINavigationController {
            return topViewController(from: navigationController.visibleViewController)
        } else if let tabBarController = viewcontroller as? UITabBarController, let selected = tabBarController.selectedViewController {
            return topViewController(from: selected)
        } else if let presented = viewcontroller.presentedViewController {
            return topViewController(from: presented)
        }
        return viewcontroller
    }
}
