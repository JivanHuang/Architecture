//
//  UICollectionView+Register.swift
//  Architecture
//
//  Created by Jivan on 2022/9/5.
//

#if canImport(UIKit) && !os(watchOS)

import UIKit

public extension UICollectionView {
    func registerNibFromClass<T: UICollectionViewCell>(type: T.Type) {
        let className = T.className
        let nib = UINib(nibName: className, bundle: nil)
        register(nib, forCellWithReuseIdentifier: className)
    }

    func registerNibFromClass<T: UICollectionReusableView>(type: T.Type, forSupplementaryViewOfKind kind: String) {
        let className = T.className
        let nib = UINib(nibName: className, bundle: nil)
        register(nib, forSupplementaryViewOfKind: kind, withReuseIdentifier: className)
    }

    func registerClassFromClass<T: UICollectionViewCell>(type: T.Type) {
        let className = T.className
        register(T.self, forCellWithReuseIdentifier: className)
    }

    func registerClassFromClass<T: UICollectionReusableView>(type: T.Type, forSupplementaryViewOfKind kind: String) {
        let className = T.className
        register(T.self, forSupplementaryViewOfKind: kind, withReuseIdentifier: className)
    }

    func dequeueReusableCell<T: UICollectionViewCell>(type: T.Type, forIndexPath indexPath: IndexPath) -> T
    {
        dequeueReusableCell(withReuseIdentifier: T.className, for: indexPath) as! T
    }

    func dequeueReusableView<T: UICollectionReusableView>(kind: String, withReuseType type: T.Type, forIndexPath indexPath: IndexPath) -> T
    {
        dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: T.className, for: indexPath) as! T
    }
}

#endif
