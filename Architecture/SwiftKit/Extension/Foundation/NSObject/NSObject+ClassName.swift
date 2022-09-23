//
//  NSObject+ClassName.swift
//  Architecture
//
//  Created by Jivan on 2022/5/23.
//

#if canImport(Foundation)
import Foundation

#if os(iOS) || os(tvOS)

public extension NSObject {
    var className: String {
        return type(of: self).className
    }

    static var className: String {
        return String(describing: self)
    }
}

#endif

#endif
