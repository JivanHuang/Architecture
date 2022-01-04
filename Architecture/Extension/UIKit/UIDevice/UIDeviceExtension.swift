//
//  UIDeviceExtension.swift
//  Architecture
//
//  Created by Jivan on 2021/12/6.
//

import UIKit

public extension UIDevice {
    var isIphoneXSeries: Bool {
        if self.userInterfaceIdiom != .phone {
            return false
        }
        if #available(iOS 11.0, *) {
            if let mainWindow = UIApplication.shared.delegate?.window {
                if (mainWindow!.safeAreaInsets.bottom) > 0.0 {
                    return true
                }
            }
        }

        return false
    }
}
