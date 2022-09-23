//
//  UITableView+Register.swift
//  Architecture
//
//  Created by Jivan on 2022/9/5.
//

#if canImport(UIKit) && !os(watchOS)

import UIKit

public extension UITableView {
    func registerNibFromClass<T: UITableViewCell>(type: T.Type) {
        let className = T.className
        let nib = UINib(nibName: className, bundle: nil)
        register(nib, forCellReuseIdentifier: className)
    }

    func registerNibFromHeaderFooterViewClass<T: UITableViewHeaderFooterView>(type: T.Type) {
        let className = T.className
        let nib = UINib(nibName: className, bundle: nil)
        register(nib, forHeaderFooterViewReuseIdentifier: className)
    }

    func registerClassFromClass<T: UITableViewCell>(type: T.Type) {
        register(T.self, forCellReuseIdentifier: T.className)
    }

    func registerClassHeaderFooterViewFromClass<T: UITableViewHeaderFooterView>(type: T.Type) {
        register(T.self, forHeaderFooterViewReuseIdentifier: T.className)
    }

    func dequeueReusableCell<T: UITableViewCell>(type: T.Type, forIndexPath indexPath: IndexPath) -> T {
        return dequeueReusableCell(withIdentifier: T.className, for: indexPath) as! T
    }

    func dequeueHeaderFooterView<T: UITableViewHeaderFooterView>(type: T.Type) -> T? {
        dequeueReusableHeaderFooterView(withIdentifier: T.className) as? T
    }
}

#endif
