//
//  CGFloatExtensions.swift
//  Architecture
//
//  Created by Jivan on 2022/10/10.
//

#if canImport(CoreGraphics)
import CoreGraphics

#if canImport(Foundation)
import Foundation
#endif

// MARK: - Properties

public extension CGFloat {
    var abs: CGFloat {
        return Swift.abs(self)
    }

    #if canImport(Foundation)
    var ceil: CGFloat {
        return Foundation.ceil(self)
    }
    #endif

    var degreesToRadians: CGFloat {
        return .pi * self / 180.0
    }

    #if canImport(Foundation)

    var floor: CGFloat {
        return Foundation.floor(self)
    }
    #endif

    var isPositive: Bool {
        return self > 0
    }

    var isNegative: Bool {
        return self < 0
    }

    var int: Int {
        return Int(self)
    }

    var float: Float {
        return Float(self)
    }

    var double: Double {
        return Double(self)
    }

    var radiansToDegrees: CGFloat {
        return self * 180 / CGFloat.pi
    }
}

#endif
