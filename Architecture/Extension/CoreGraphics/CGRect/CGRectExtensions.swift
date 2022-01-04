//
//  Created by Mulang Su on 11/01/2017.
//  Copyright © 2017 Jivan. All rights reserved.
//

import CoreGraphics

// MARK: - Getter

public extension CGRect {
    /// Returns the `x` value of the CGRect.
    var x: CGFloat {
        origin.x
    }

    /// Returns the `y` value of the CGRect.
    var y: CGFloat {
        origin.y
    }
}

// MARK: - Transform

public extension CGRect {
    /// Replace the current CGRect's `x` value with a new one.
    /// - Parameter x: The new `x` value.
    /// - Returns: The `CGRect` containing the new `x` value.
    func with(x: CGFloat) -> CGRect {
        CGRect(x: x, y: y, width: width, height: height)
    }

    /// Replace the current CGRect's `y` value with a new one.
    /// - Parameter y: The new `y` value.
    /// - Returns: The `CGRect` containing the new `y` value.
    func with(y: CGFloat) -> CGRect {
        CGRect(x: x, y: y, width: width, height: height)
    }

    /// Replace the current CGRect's `width` value with a new one.
    /// - Parameter width: The new `width` value.
    /// - Returns: The `CGRect` containing the new `width` value.
    func with(width: CGFloat) -> CGRect {
        CGRect(x: x, y: y, width: width, height: height)
    }

    /// Replace the current CGRect's `height` value with a new one.
    /// - Parameter height: The new `height` value.
    /// - Returns: The `CGRect` containing the new `height` value.
    func with(height: CGFloat) -> CGRect {
        CGRect(x: x, y: y, width: width, height: height)
    }

    /// Replace the current CGRect's `origin` value with a new one.
    /// - Parameter origin: The new `origin` value.
    /// - Returns: The `CGRect` containing the new `origin` value.
    func with(origin: CGPoint) -> CGRect {
        CGRect(origin: origin, size: size)
    }

    /// Replace the current CGRect's `size` value with a new one.
    /// - Parameter size: The new `size` value.
    /// - Returns: The `CGRect` containing the new `size` value.
    func with(size: CGSize) -> CGRect {
        CGRect(origin: origin, size: size)
    }
}
