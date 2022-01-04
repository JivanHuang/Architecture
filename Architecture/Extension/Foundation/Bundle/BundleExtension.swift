//
//  Created by Jivan on 24/04/21.
//  Copyright Jivan. All rights reserved.
//

import Foundation

// MARK: - App Information

public extension Bundle {
    /// The app name extracted from the `infoDictionary`.
    /// - Returns: String.
    var appName: String {
        string(for: kCFBundleNameKey as String)
    }

    /// The app version extracted from the `infoDictionary`.
    /// - Returns: String.
    @objc var appVersion: String {
        string(for: "CFBundleShortVersionString")
    }

    /// The display name extracted from the `infoDictionary`.
    /// - Returns: String.
    var displayName: String {
        string(for: "CFBundleDisplayName")
    }

    /// The app build extracted from the `infoDictionary`.
    /// - Returns: String.
    var appBuild: String {
        string(for: kCFBundleVersionKey as String)
    }

    /// The app bundle identifier extracted from the `infoDictionary`.
    /// - Returns: String.
    var bundleId: String {
        string(for: "CFBundleIdentifier")
    }
}

// MARK: - Status

public extension Bundle {
    /// Check either the app has been installed using TestFlight.
    /// - Returns: Bool.
    var isInTestFlight: Bool {
        appStoreReceiptURL?.path.contains("sandboxReceipt") == true
    }
}

// MARK: - Schemes

public extension Bundle {
    var schemes: [String] {
        guard let infoDictionary = Bundle.main.infoDictionary,
              let urlTypes = infoDictionary["CFBundleURLTypes"] as? [AnyObject],
              let urlType = urlTypes.first as? [String: AnyObject],
              let urlSchemes = urlType["CFBundleURLSchemes"] as? [String]
        else {
            return []
        }
        return urlSchemes
    }

    var mainScheme: String? {
        schemes.first
    }
}

// MARK: - Internal

extension Bundle {
    private func string(for key: String) -> String {
        guard let infoDictionary = Bundle.main.infoDictionary,
              let value = infoDictionary[key] as? String
        else {
            return ""
        }
        return value
    }
}
