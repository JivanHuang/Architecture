//
//  MD5StringEncoder.swift
//  SwiftKit
//
//  Created by Jivan on 2022/5/23.
//

#if canImport(Foundation)
import Foundation
#if canImport(CommonCrypto)
import CommonCrypto

// MD5 加密已经不在安全
public class MD5StringEncoder: StringEncoder {
    public init() {}

    public func encode(_ string: String) -> String? {
        guard let chars = string.cString(using: .utf8) else { return string }
        let stringLegth = CUnsignedInt(string.lengthOfBytes(using: .utf8))
        let digestLen = Int(CC_MD5_DIGEST_LENGTH)
        let result = UnsafeMutablePointer<CUnsignedChar>.allocate(capacity: digestLen)
        CC_MD5(chars, stringLegth, result)
        var hash = String()
        for i in 0 ..< digestLen {
            hash += String(format: "%02x", result[i])
        }
        result.deallocate()
        return hash
    }
}

#endif

#endif
