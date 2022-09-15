//
//  Router.swift
//  Architecture
//
//  Created by Jivan on 2022/9/15.
//

import UIKit

public struct Router {}

public extension Router {
    /// 获取当前正在显示的视图控制器
    static func topVisibleViewController(from viewcontroller: UIViewController? = UIApplication.shared.window?.rootViewController)
        -> UIViewController?
    {
        guard let viewcontroller = viewcontroller else {
            return nil
        }
        if let navigationController = viewcontroller as? UINavigationController {
            return topVisibleViewController(from: navigationController.visibleViewController)
        } else if let tabBarController = viewcontroller as? UITabBarController, let selected = tabBarController.selectedViewController {
            return topVisibleViewController(from: selected)
        } else if let presented = viewcontroller.presentedViewController {
            return topVisibleViewController(from: presented)
        }
        return viewcontroller
    }
}
