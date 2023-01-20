//
//  Direction.swift
//  WanBox
//
//  Created by Jivan on 2022/12/27.
//  Copyright © 2022 Jivan. All rights reserved.
//

import CoreGraphics

public enum Direction {
    case top
    case left
    case right
    case bottom
    case degree(CGFloat)
}

public extension Direction {
    var startPoint: CGPoint {
        switch self {
        case .top:
            return CGPoint(x: 0.5, y: 1.0)
        case .left:
            return CGPoint(x: 1.0, y: 0.5)
        case .right:
            return CGPoint(x: 0.0, y: 0.5)
        case .bottom:
            return CGPoint(x: 0.5, y: 0.0)
        case .degree(let degree):
            let radian = degree * .pi / 180
            return CGPoint(x: 0.5 * (cos(radian) + 1), y: 0.5 * (1 - sin(radian)))
        }
    }

    var endPoint: CGPoint {
        switch self {
        case .top:
            return CGPoint(x: 0.5, y: 0.0)
        case .left:
            return CGPoint(x: 0.0, y: 0.5)
        case .right:
            return CGPoint(x: 1.0, y: 0.5)
        case .bottom:
            return CGPoint(x: 0.5, y: 1.0)
        case .degree(let degree):
            let radian = degree * .pi / 180
            return CGPoint(x: 0.5 * (cos(radian + .pi) + 1), y: 0.5 * (1 + sin(radian)))
        }
    }
}

