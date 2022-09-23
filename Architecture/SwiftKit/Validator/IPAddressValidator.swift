//
//  IPAddressValidator.swift
//  SwiftKit
//
//  Created by Jivan on 2022/5/17.
//

#if canImport(Foundation)
import Foundation

public class IPAddressValidator: Validator {
    public init() {}

    public func validate(_ string: String) -> Bool {
        return IP4AddressValidator().validate(string) || IP6AddressValidator().validate(string)
    }
}

public class IP4AddressValidator: Validator {
    public init() {}

    public func validate(_ string: String) -> Bool {
        var sin = sockaddr_in()
        return string.withCString { cstring in inet_pton(AF_INET, cstring, &sin.sin_addr) } == 1
    }
}

public class IP6AddressValidator: Validator {
    public init() {}

    public func validate(_ string: String) -> Bool {
        var sin6 = sockaddr_in6()
        return string.withCString { cstring in inet_pton(AF_INET6, cstring, &sin6.sin6_addr) } == 1
    }
}
#endif
