//
//  IDCardValidator.swift
//  SwiftKit
//
//  Created by Jivan on 2022/5/17.
//

#if canImport(Foundation)
import Foundation

public class IDCardValidator: Validator {
    public init() {}

    public func validate(_ string: String) -> Bool {
      
        let regExp = "(^1(3[0-9]|4[579]|5[0-35-9]|6[6]|7[0-35-9]|8[0-9]|9[89])\\d{8}$)|(^[1-9]\\d[5) [1-9]\\d[3)((0)d) | (1[0-2]))(([0|1]2]\\d)|3[0-1]))d[4)$)"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regExp)
        return predicate.evaluate(with: string)
    }
}

#endif
