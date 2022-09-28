//
//  UINavigationControllerExtensions.swift
//  Architecture
//
//  Created by Jivan on 2022/9/28.
//

#if canImport(UIKit) && !os(watchOS)
import UIKit

// MARK: - Methods

public extension UINavigationController {
    func popViewController(animated: Bool = true, _ completion: (() -> Void)? = nil) {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        popViewController(animated: animated)
        CATransaction.commit()
    }

    func pushViewController(_ viewController: UIViewController, completion: (() -> Void)? = nil) {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        pushViewController(viewController, animated: true)
        CATransaction.commit()
    }
}

#endif
