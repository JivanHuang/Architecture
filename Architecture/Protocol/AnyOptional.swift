//
//  AnyOptional.swift
//  SwiftyUtils
//
//  Created by Jivan on 25/04/2020.
//  Copyright © 2020 Jivan. All rights reserved.
//

import Foundation

public protocol AnyOptional {
    var isNil: Bool { get }
}

extension Optional: AnyOptional {
    public var isNil: Bool { self == nil }
}
