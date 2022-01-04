//
//  Created by Jivan on 24/04/21.
//  Copyright Jivan. All rights reserved.
//

import Foundation

public protocol Occupiable {
    var isEmpty: Bool { get }
    var isNotEmpty: Bool { get }
}

extension Occupiable {
    public var isNotEmpty: Bool {
        !isEmpty
    }
}

extension String: Occupiable { }
extension Array: Occupiable { }
extension Dictionary: Occupiable { }
extension Set: Occupiable { }

extension Optional where Wrapped: Occupiable {
    public var isNilOrEmpty: Bool {
        switch self {
        case .none:
            return true
        case let .some(value):
            return value.isEmpty
        }
    }

    public var isNotNilNotEmpty: Bool {
        !isNilOrEmpty
    }
}
