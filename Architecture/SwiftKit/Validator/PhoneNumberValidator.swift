//
//  PhoneNumberValidator.swift
//  SwiftKit
//
//  Created by Jivan on 2022/5/17.
//

#if canImport(Foundation)
import Foundation
/**
 中国电信号段：133、149、153、173、177、180、181、189、199、191。

 中国联通号段：130、131、132、145、155、156、166、167、171、175、176、185、186。

 中国移动号段：134(0-8)、135、136、137、138、139、147、150、151、152、157、158、159、172、178、182、183、184、187、188、198。
  
 中国广电号段： 192

 虚拟运营号：170
 */
public class PhoneNumberValidator: Validator {
    public init() {}

    public func validate(_ string: String) -> Bool {
        let regExp = "^1(3[0-9]|4[0-9]|5[0-35-9]|6[67]|7[0-35-9]|8[0-9]|9[1289])\\d{8}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regExp)
        return predicate.evaluate(with: string)
    }
    
}
#endif
