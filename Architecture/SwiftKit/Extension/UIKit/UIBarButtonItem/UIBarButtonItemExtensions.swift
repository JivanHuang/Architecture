//
//  UIBarButtonItemExtensions.swift
//  Architecture
//
//  Created by Jivan on 2022/9/28.
//

#if canImport(UIKit) && !os(watchOS)
import UIKit

// MARK: - Properties

public extension UIBarButtonItem {

    static var flexibleSpace: UIBarButtonItem {
        return UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
    }
}

// MARK: - Methods

public extension UIBarButtonItem {
 
    func addTargetForAction(_ target: AnyObject, action: Selector) {
        self.target = target
        self.action = action
    }

    static func fixedSpace(width: CGFloat) -> UIBarButtonItem {
        let barButtonItem = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        barButtonItem.width = width
        return barButtonItem
    }
}

#endif
