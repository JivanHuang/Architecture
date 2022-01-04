//
//  Created by Jivan on 24/04/21.
//  Copyright Jivan. All rights reserved.
//

import Foundation

// swiftlint:disable convenience_type
public enum SBDateFormatter {
    public static let shared = DateFormatter()
}

public enum SBNumberFormatter {
    public static let shared = NumberFormatter()
}

public enum SBByteCountFormatter {
    public static let shared = ByteCountFormatter()
}

public enum SBDateComponentsFormatter {
    public static let shared = DateComponentsFormatter()
}

public enum SBDateIntervalFormatter {
    public static let shared = DateIntervalFormatter()
}

public enum SBEnergyFormatter {
    public static let shared = EnergyFormatter()
}

public enum SBMassFormatter {
    public static let shared = MassFormatter()
}

public enum SBLengthFormatter {
    public static let shared = LengthFormatter()
}
