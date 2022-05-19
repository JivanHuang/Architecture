//
//  Optional+IsSet.swift
//  SwiftKit
//
//  Created by Jivan on 2022/5/17.
//

import Foundation

public extension Optional {
    var isNil: Bool { self == nil }
    var isSet: Bool { self != nil }
}
