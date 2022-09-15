//
//  UIView+Container.swift
//  Architecture
//
//  Created by Jivan on 2022/9/15.
//

import UIKit

public extension UIView {
    /// 视图所在的控制器
    var containerController: UIViewController? {
        var nextResponder: UIResponder? = self
        repeat {
            nextResponder = nextResponder?.next
            if let viewController = nextResponder as? UIViewController {
                return viewController
            }
        } while nextResponder != nil

        return nil
    }
}
