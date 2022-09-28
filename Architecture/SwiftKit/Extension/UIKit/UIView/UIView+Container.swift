//
//  UIView+Container.swift
//  Architecture
//
//  Created by Jivan on 2022/9/15.
//

#if canImport(UIKit)
import UIKit

public extension UIView {
    /// 视图所在的控制器
    var parentViewController: UIViewController? {
        weak var parentResponder: UIResponder? = self
        while parentResponder != nil {
            parentResponder = parentResponder!.next
            if let viewController = parentResponder as? UIViewController {
                return viewController
            }
        }
        return nil
    }
}
#endif
