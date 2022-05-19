//
//  StringCoder.swift
//  SwiftKit
//
//  Created by Jivan on 2022/5/17.
//

import Foundation

public protocol StringCoder: StringEncoder, StringDecoder {}

public protocol StringEncoder: AnyObject {
    func encode(_ string: String) -> String?
}

public protocol StringDecoder: AnyObject {
    func decode(_ string: String) -> String?
}
