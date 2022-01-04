//
//  Created by Jivan on 24/04/21.
//  Copyright Jivan. All rights reserved.
//

import Foundation

// MARK: - Time Transform

public extension Double {
    /// Convert the value to milliseconds `TimeInterval`.
    var millisecond: TimeInterval { self / 1000 }
    /// Convert the value to milliseconds `TimeInterval`.
    var milliseconds: TimeInterval { self / 1000 }
    /// Convert the value to milliseconds `TimeInterval`.
    var ms: TimeInterval { self / 1000 }

    /// Convert the value to seconds `TimeInterval`.
    var second: TimeInterval { self }
    /// Convert the value to seconds `TimeInterval`.
    var seconds: TimeInterval { self }

    /// Convert the value to minutes `TimeInterval`.
    var minute: TimeInterval { self * 60 }
    /// Convert the value to minutes `TimeInterval`.
    var minutes: TimeInterval { self * 60 }

    /// Convert the value to hours `TimeInterval`.
    var hour: TimeInterval { self * 3600 }
    /// Convert the value to hours `TimeInterval`.
    var hours: TimeInterval { self * 3600 }

    /// Convert the value to days `TimeInterval`.
    var day: TimeInterval { self * 3600 * 24 }
    /// Convert the value to days `TimeInterval`.
    var days: TimeInterval { self * 3600 * 24 }
}

// MARK: - Transform

public extension Double {
    /// Transforme the Double to a formatted price including currency (using the current locale).
    /// - Returns: A formatted price following the locale.
    var formattedPrice: String {
        let formatter = SBNumberFormatter.shared
        formatter.numberStyle = .currency
        formatter.locale = Locale.current
        return formatter.string(from: self as NSNumber)!
    }
}
