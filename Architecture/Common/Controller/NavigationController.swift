//
//  NavigationController.swift
//  Architecture
//
//  Created by Jivan on 2021/8/18.
//

import UIKit

class NavigationController: UINavigationController {
    var popDelegate: UIGestureRecognizerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        popDelegate = interactivePopGestureRecognizer?.delegate
        delegate = self
    }

    // Push二级界面自动隐藏TabBar
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if viewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: animated)
    }

    // 修复iOS14 popToRootViewControllerAnimated tabBar 消失问题
    override func popToRootViewController(animated: Bool) -> [UIViewController]? {
        if animated {
            let popController = viewControllers.last
            popController?.hidesBottomBarWhenPushed = false
        }
        return super.popToRootViewController(animated: animated)
    }
}

extension NavigationController: UINavigationControllerDelegate {
    // 解决自定义导航控制器侧滑返回手势失效问题
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        if viewController == viewControllers[0] {
            interactivePopGestureRecognizer!.delegate = popDelegate
        } else {
            interactivePopGestureRecognizer!.delegate = nil
        }
    }
}
