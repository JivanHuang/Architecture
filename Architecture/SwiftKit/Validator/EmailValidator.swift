//
//  EmailValidator.swift
//  SwiftKit
//
//  Created by Jivan on 2022/5/17.
//

import Foundation

public class EmailValidator: Validator {
    public init() {}

    public func validate(_ string: String) -> Bool {
        let regExp = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,} ?"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regExp)
        return predicate.evaluate(with: string)
    }
}
