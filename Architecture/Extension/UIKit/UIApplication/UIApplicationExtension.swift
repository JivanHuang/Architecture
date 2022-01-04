//
//  UIApplicationExtension.swift
//  Architecture
//
//  Created by Jivan on 2021/8/19.
//

import UIKit

// MARK: ViewController

extension UIApplication {
    /// Get the top most visible view controller currently shown.
    /// - Parameter baseVC: Optional view controller used to start the research of the top most visible.
    ///                     Default value is `UIApplication.shared.keyWindow?.rootViewController`
    /// - Returns: The top most view controller found, otherwise nil.
    public func topViewController(from baseVC: UIViewController? = UIApplication.shared.keyWindow?.rootViewController)
        -> UIViewController? {
        guard let baseVC = baseVC else {
            return nil
        }

        if let nav = baseVC as? UINavigationController {
            return topViewController(from: nav.visibleViewController)
        } else if let tab = baseVC as? UITabBarController, let selected = tab.selectedViewController {
            return topViewController(from: selected)
        } else if let presented = baseVC.presentedViewController {
            return topViewController(from: presented)
        }
        return baseVC
    }
}

// MARK: Open

@available(iOS 10.0, tvOS 10.0, *)
extension UIApplication {
    /// Open app settings
    public func openAppSettings() {
        guard let url = URL(string: UIApplication.openSettingsURLString) else {
            return
        }
        open(url, options: [:], completionHandler: nil)
    }

    /// Open app review page
    public func openAppStoreReviewPage(_ url: URL) {
        DispatchQueue.main.async {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}

// MARK: AppDelegate

extension UIApplication {
    /// Get the UIApplication delegate
    public static func delegate<T: UIApplicationDelegate>(_ type: T.Type) -> T? {
        UIApplication.shared.delegate as? T
    }
}
