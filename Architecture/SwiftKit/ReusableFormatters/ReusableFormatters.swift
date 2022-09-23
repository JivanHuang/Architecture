//
//  ReusableFormatters.swift
//  SwiftKit
//
//  Created by Jivan on 2022/5/17.
//

#if canImport(Foundation)
import Foundation

public enum SKDateFormatter {
    static let shared = DateFormatter()
}

public enum SKNumberFormatter {
    static let shared = NumberFormatter()
}

public enum SKByteCountFormatter {
    static let shared = ByteCountFormatter()
}

public enum SKDateComponentsFormatter {
    static let shared = DateComponentsFormatter()
}

public enum SKDateIntervalFormatter {
    static let shared = DateIntervalFormatter()
}

public enum SKEnergyFormatter {
    static let shared = EnergyFormatter()
}

public enum SKMassFormatter {
    static let shared = MassFormatter()
}

public enum SKLengthFormatter {
    static let shared = LengthFormatter()
}
#endif
