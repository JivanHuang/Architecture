//
//  CGRect+Transform.swift
//  SwiftKit
//
//  Created by Jivan on 2022/5/17.
//

#if canImport(CoreGraphics)
import CoreGraphics

public extension CGRect {
    var x: CGFloat {
        origin.x
    }

    var y: CGFloat {
        origin.y
    }

    var center: CGPoint {
        CGPoint(x: midX, y: midY)
    }
}

public extension CGRect {
    init(center: CGPoint, size: CGSize) {
        let origin = CGPoint(x: center.x - size.width / 2.0, y: center.y - size.height / 2.0)
        self.init(origin: origin, size: size)
    }
}

public extension CGRect {
    func with(x: CGFloat) -> CGRect {
        CGRect(x: x, y: y, width: width, height: height)
    }

    func with(y: CGFloat) -> CGRect {
        CGRect(x: x, y: y, width: width, height: height)
    }

    func with(width: CGFloat) -> CGRect {
        CGRect(x: x, y: y, width: width, height: height)
    }

    func with(height: CGFloat) -> CGRect {
        CGRect(x: x, y: y, width: width, height: height)
    }

    func with(origin: CGPoint) -> CGRect {
        CGRect(origin: origin, size: size)
    }

    func with(size: CGSize) -> CGRect {
        CGRect(origin: origin, size: size)
    }
}

#endif
