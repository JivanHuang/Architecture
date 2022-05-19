//
//  UIViewController+Modal.swift
//  SwiftKit
//
//  Created by Jivan on 2022/5/17.
//

import UIKit

public extension UIViewController {
    /// 是否可见
    var isVisible: Bool {
        isViewLoaded && view.window != nil
    }

    /// 是否模态弹出
    var isModal: Bool {
        presentingViewController?.presentedViewController == self ||
            navigationController?.presentingViewController?.presentedViewController == navigationController ||
            tabBarController?.presentingViewController is UITabBarController
    }
}
