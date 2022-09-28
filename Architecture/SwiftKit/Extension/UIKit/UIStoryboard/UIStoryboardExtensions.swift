//
//  UIStoryboardExtensions.swift
//  Architecture
//
//  Created by Jivan on 2022/9/28.
//

#if canImport(UIKit) && !os(watchOS)
import UIKit

// MARK: - Methods

public extension UIStoryboard {

    static var main: UIStoryboard? {
        let bundle = Bundle.main
        guard let name = bundle.object(forInfoDictionaryKey: "UIMainStoryboardFile") as? String else { return nil }
        return UIStoryboard(name: name, bundle: bundle)
    }

    func instantiateViewController<T: UIViewController>(withClass name: T.Type) -> T? {
        return instantiateViewController(withIdentifier: String(describing: name)) as? T
    }
}

#endif
