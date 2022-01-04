//
//  Created by Jivan on 09/04/2017.
//  Copyright © 2017 Jivan. All rights reserved.
//

import CoreGraphics

// MARK: - Operators

public extension CGSize {
    static func + (lhs: CGSize, rhs: CGSize) -> CGSize {
        CGSize(width: lhs.width + rhs.width, height: lhs.height + rhs.height)
    }

    static func - (lhs: CGSize, rhs: CGSize) -> CGSize {
        CGSize(width: lhs.width - rhs.width, height: lhs.height - rhs.height)
    }

    static func * (size: CGSize, scalar: CGFloat) -> CGSize {
        CGSize(width: size.width * scalar, height: size.height * scalar)
    }
}

// swiftlint:disable:next static_operator
public func += (lhs: inout CGSize, rhs: CGSize) {
    lhs = CGSize(width: lhs.width + rhs.width, height: lhs.height + rhs.height)
}

// swiftlint:disable:next static_operator
public func -= (lhs: inout CGSize, rhs: CGSize) {
    lhs = CGSize(width: lhs.width - rhs.width, height: lhs.height - rhs.height)
}

// swiftlint:disable:next static_operator
public func *= (size: inout CGSize, scalar: CGFloat) {
    size = CGSize(width: size.width * scalar, height: size.height * scalar)
}
