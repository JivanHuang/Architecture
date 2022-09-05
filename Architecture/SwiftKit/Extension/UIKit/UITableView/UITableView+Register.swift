//
//  UITableView+Register.swift
//  Architecture
//
//  Created by Jivan on 2022/9/5.
//

import UIKit

public extension UITableView {
    func registerNibFromClass<T: UITableViewCell>(type: T.Type) {
        let className = T.className
        let nib = UINib(nibName: className, bundle: nil)
        register(nib, forCellReuseIdentifier: className)
    }

    func registerClassFromClass<T: UITableViewCell>(type: T.Type) {
        let className = T.className
        register(T.self, forCellReuseIdentifier: className)
    }

    func dequeueReusableCell<T: UITableViewCell>(type: T.Type, forIndexPath indexPath: IndexPath) -> T
    {
        return dequeueReusableCell(withIdentifier: T.className, for: indexPath) as! T
    }
}
