//
//  UIApplication+keyWindow.swift
//  SwiftKit
//
//  Created by Jivan on 2022/5/16.
//

#if canImport(UIKit)
import UIKit

#if os(iOS) || os(tvOS)

public extension UIApplication {
    /// 获取当前的keywindow
    var window: UIWindow? {
        var result: UIWindow?
        if #available(iOS 13.0, *) {
            for scene in UIApplication.shared.connectedScenes {
                if let scene = scene as? UIWindowScene, scene.activationState == .foregroundActive {
                    for window in scene.windows {
                        if window.isKeyWindow {
                            result = window
                        }
                    }
                }
            }
        }
        if result == nil {
            for window in UIApplication.shared.windows {
                if window.isKeyWindow {
                    result = window
                }
            }
        }
        return result
    }
}

public extension UIApplication {

    enum Environment {
    
        case debug

        case testFlight

        case appStore
    }

    var inferredEnvironment: Environment {
        #if DEBUG
        return .debug

        #elseif targetEnvironment(simulator)
        return .debug

        #else
        if Bundle.main.path(forResource: "embedded", ofType: "mobileprovision") != nil {
            return .testFlight
        }

        guard let appStoreReceiptUrl = Bundle.main.appStoreReceiptURL else {
            return .debug
        }

        if appStoreReceiptUrl.lastPathComponent.lowercased() == "sandboxreceipt" {
            return .testFlight
        }

        if appStoreReceiptUrl.path.lowercased().contains("simulator") {
            return .debug
        }

        return .appStore
        #endif
    }


    var displayName: String? {
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleDisplayName") as? String
    }

    var buildNumber: String? {
        return Bundle.main.object(forInfoDictionaryKey: kCFBundleVersionKey as String) as? String
    }

    var version: String? {
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String
    }
}


#endif

#endif
