//
//  Bundle+BundleInformation.swift
//  SwiftKit
//
//  Created by Jivan on 2022/5/17.
//

import Foundation

public protocol BundleInformation {
    var buildNumber: String { get }
    var displayName: String { get }
    var versionNumber: String { get }
}

extension Bundle: BundleInformation {
    public var buildNumber: String {
        let key = String(kCFBundleVersionKey)
        let version = infoDictionary?[key] as? String
        return version ?? ""
    }
    
    public var displayName: String {
        infoDictionary?["CFBundleDisplayName"] as? String ?? ""
    }
    
    public var versionNumber: String {
        let key = "CFBundleShortVersionString"
        let version = infoDictionary?[key] as? String
        return version ?? "0.0.0"
    }
}
