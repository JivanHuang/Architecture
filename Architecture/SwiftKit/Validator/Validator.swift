//
//  Validator.swift
//  SwiftKit
//
//  Created by Jivan on 2022/5/17.
//

import Foundation

public protocol Validator {
    associatedtype Validation

    func validate(_ obj: Validation) -> Bool
}
