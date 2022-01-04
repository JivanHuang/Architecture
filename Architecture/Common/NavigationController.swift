//
//  NavigationController.swift
//  Architecture
//
//  Created by Jivan on 2021/8/18.
//

import UIKit

class NavigationController: UINavigationController {
    /// 解决侧滑返回手势失效问题
    var popDelegate: UIGestureRecognizerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        popDelegate = interactivePopGestureRecognizer?.delegate
        delegate = self
    }

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if viewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: animated)
    }
}

extension NavigationController: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        if viewController == viewControllers[0] {
            interactivePopGestureRecognizer!.delegate = popDelegate
        } else {
            interactivePopGestureRecognizer!.delegate = nil
        }
    }
}
