//
//  Created by Jivan on 24/04/21.
//  Copyright Jivan. All rights reserved.
//

import Foundation

// MARK: - Misc

public extension Int {
    /// Check if the value is even or not.
    var isEven: Bool { isMultiple(of: 2) }
    /// Check if the value is odd or not.
    var isOdd: Bool { !isEven }
    /// Check if the value is positive or not.
    var isPositive: Bool { self > 0 }
    /// Check if the value is negative or not.
    var isNegative: Bool { !isPositive }
    /// Create a range from 0 to the current value.
    var range: Range<Int> { 0 ..< self }

    /// Returns the number of digits this number.
    var digits: Int {
        if self == 0 {
            return 1
        }
        return Int(log10(fabs(Double(self)))) + 1
    }
}

// MARK: - Transform

public extension Int {
    /// Transforme the Double to a formatted price including currency (using the current locale).
    /// - Returns: A formatted price following the locale.
    var formattedPrice: String {
        let formatter = SBNumberFormatter.shared
        formatter.numberStyle = .currency
        formatter.locale = Locale.current
        return formatter.string(from: self as NSNumber)!
    }
}

// MARK: - Round

public extension Int {
    /// Round the current value to the nearest dozens.
    var nearestDozens: Int { nearest(to: 10) }
    /// Round the current value to the nearest hundreds.
    var nearestHundreds: Int { nearest(to: 100) }
    /// Round the current value to the nearest thousands.
    var nearestThousands: Int { nearest(to: 1000) }

    /// Caclulate the nearest below value for this number in comparison with a specified value.
    /// - Parameter value: The value that will be used to search the nearest up.
    /// - Returns: The nearest value to the speficied value.
    func nearest(to value: Int) -> Int {
        self / value * value + (self % value) / (value / 2) * value
    }
}

// MARK: - Round below

public extension Int {
    /// Round the current value to the nearest below dozens.
    var nearestBelowDozens: Int { nearestBelow(to: 10) }
    /// Round the current value to the nearest below hundreds.
    var nearestBelowHundreds: Int { nearestBelow(to: 100) }
    /// Round the current value to the nearest below thousands.
    var nearestBelowThousands: Int { nearestBelow(to: 1000) }

    /// Caclulate the nearest below value for this number in comparison with a specified value.
    /// - Parameter value: The value that will be used to search the nearest up.
    /// - Returns: The nearest below value to the speficied value.
    func nearestBelow(to value: Int) -> Int {
        self / value * value + 0 / (value / 2) * value
    }
}

// MARK: - Round Up

public extension Int {
    /// Round the current value to the nearest up dozens.
    var nearestUpDozens: Int { nearestUp(to: 10) }
    /// Round the current value to the nearest up hundreds.
    var nearestUpHundreds: Int { nearestUp(to: 100) }
    /// Round the current value to the nearest up thousands.
    var nearestUpThousands: Int { nearestUp(to: 1000) }

    /// Caclulate the nearest up value for this number in comparison with a specified value.
    /// - Parameter value: The value that will be used to search the nearest up.
    /// - Returns: The nearest up value to the speficied value.
    func nearestUp(to value: Int) -> Int {
        self / value * value + (value / 2) / (value / 2) * value
    }
}
