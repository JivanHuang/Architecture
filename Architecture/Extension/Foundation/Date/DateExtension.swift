//
//  Created by Jivan on 24/04/21.
//  Copyright Jivan. All rights reserved.
//

import Foundation

// MARK: - Initializers

public extension Date {
    /// Initialize a Date from a String and a specified format.
    /// - Parameters:
    ///   - string: The string to map.
    ///   - format: The format which will be used to create the `Date`.
    /// - Returns: If sucessfull, the `Date` created from the `string` and format,
    ///            otherwise `nil` meaning that's the `string` didn't match the `format`.
    init?(fromString string: String, format: String) {
        let formatter = SBDateFormatter.shared
        formatter.dateFormat = format
        guard let date = formatter.date(from: string) else {
            return nil
        }
        self.init(timeInterval: 0, since: date)
    }
}

// MARK: - Format

public extension Date {
    /// Create a String from a Date.
    /// - Parameters:
    ///   - dateStyle: the date style that will be applied when creating the string. Default is `medium`.
    ///   - timeStyle: the time style that will be applied when creating the string. Default is `medium`.
    /// - Returns: the string created from the `Date` and formatted using the `dateStyle` and `timeStyle`.
    func string(dateStyle: DateFormatter.Style = .medium, timeStyle: DateFormatter.Style = .medium) -> String {
        let formatter = SBDateFormatter.shared
        formatter.dateStyle = dateStyle
        formatter.timeStyle = timeStyle
        return formatter.string(from: self as Date)
    }

    /// Create a String from a Date.
    func string(format: String) -> String {
        let formatter = SBDateFormatter.shared
        formatter.dateFormat = format
        return formatter.string(from: self as Date)
    }
}

// MARK: - Since

public extension Date {
    /// Calculate the number of days since another `Date`.
    /// - Parameter date: the date that will be used for to calculate the number of days.
    /// - Returns: the number of days since the dedicated dates.
    func days(since date: Date) -> Double {
        var diff = timeIntervalSinceNow - date.timeIntervalSinceNow
        diff = fabs(diff / 86400)
        return diff
    }

    /// Calculate the number of hours since another `Date`.
    /// - Parameter date: the date that will be used for to calculate the number of hours.
    /// - Returns: the number of hours since the dedicated dates.
    func hours(since date: Date) -> Double {
        var diff = timeIntervalSinceNow - date.timeIntervalSinceNow
        diff = fabs(diff / 3600)
        return diff
    }

    /// Calculate the number of minutes since another `Date`.
    /// - Parameter date: the date that will be used for to calculate the number of minutes.
    /// - Returns: the number of minutes since the dedicated dates.
    func minutes(since date: Date) -> Double {
        var diff = timeIntervalSinceNow - date.timeIntervalSinceNow
        diff = fabs(diff / 60)
        return diff
    }

    /// Calculate the number of seconds since another `Date`.
    /// - Parameter date: the date that will be used for to calculate the number of seconds.
    /// - Returns: the number of seconds since the dedicated dates.
    func seconds(since date: Date) -> Double {
        var diff = timeIntervalSinceNow - date.timeIntervalSinceNow
        diff = fabs(diff)
        return diff
    }
}

// MARK: - IsIn

public extension Date {
    /// Check if a `Date` is in the future.
    /// - Returns: Bool.
    var isInFuture: Bool {
        self > Date()
    }

    /// Check if a `Date` is in the past.
    /// - Returns: Bool.
    var isInPast: Bool {
        self < Date()
    }
}
