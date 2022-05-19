//
//  Date+Format.swift
//  SwiftKit
//
//  Created by Jivan on 2022/5/17.
//

import Foundation

public extension Date {
    init?(fromString string: String, format: String) {
        let formatter = SKDateFormatter.shared
        formatter.dateFormat = format
        guard let date = formatter.date(from: string) else {
            return nil
        }
        self.init(timeInterval: 0, since: date)
    }
}

public extension Date {
    func string(dateStyle: DateFormatter.Style = .medium, timeStyle: DateFormatter.Style = .medium) -> String {
        let formatter = SKDateFormatter.shared
        formatter.dateStyle = dateStyle
        formatter.timeStyle = timeStyle
        return formatter.string(from: self as Date)
    }

    func string(format: String) -> String {
        let formatter = SKDateFormatter.shared
        formatter.dateFormat = format
        return formatter.string(from: self as Date)
    }
}
