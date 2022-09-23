//
//  Occupiable.swift
//  Architecture
//
//  Created by Jivan on 2022/5/26.
//

#if canImport(Foundation)
import Foundation

public protocol Occupiable {
    var isEmpty: Bool { get }
    var isNotEmpty: Bool { get }
}

public extension Occupiable {
    var isNotEmpty: Bool {
        !isEmpty
    }
}

public extension Optional where Wrapped: Occupiable {
    var isNil: Bool {
        switch self {
        case .none:
            return true
        case let .some(value):
            return value.isEmpty
        }
    }

    var isNonNil: Bool {
        !isNil
    }
}

extension String: Occupiable {}
extension Array: Occupiable {}
extension Dictionary: Occupiable {}
extension Set: Occupiable {}

#endif
