//
//  Gradients+Layer.swift
//  Architecture
//
//  Created by Jivan on 2022/12/27.
//  Copyright © 2022 Jivan. All rights reserved.
//

import Foundation
import UIKit

public enum Gradients {}

public extension Gradients {
    static func linear(to direction: Direction, colors: [Int], locations: [NSNumber], filter: CIFilter? = nil) -> CAGradientLayer {
        return linear(to: direction, colors: colors.map { color in color.cgColor }, locations: locations)
    }

    static func linear(to direction: Direction, colors: [CGColor], locations: [NSNumber], filter: CIFilter? = nil) -> CAGradientLayer {
        let layer = CAGradientLayer()
        layer.startPoint = direction.startPoint
        layer.endPoint = direction.endPoint
        layer.colors = colors
        layer.locations = locations
        if let filter = filter {
            layer.backgroundFilters = [filter]
        }
        return layer
    }

    static func radial(startPoint: CGPoint, endPoint: CGPoint, colors: [Int], locations: [NSNumber], filter: CIFilter? = nil) -> CAGradientLayer {
        return radial(startPoint: startPoint, endPoint: endPoint, colors: colors.map { color in color.cgColor }, locations: locations)
    }

    static func radial(startPoint: CGPoint, endPoint: CGPoint, colors: [CGColor], locations: [NSNumber], filter: CIFilter? = nil) -> CAGradientLayer {
        let layer = CAGradientLayer()
        layer.type = .radial
        layer.startPoint = startPoint
        layer.endPoint = endPoint
        layer.colors = colors
        layer.locations = locations
        if let filter = filter {
            layer.backgroundFilters = [filter]
        }
        return layer
    }
}

extension Int {
    var cgColor: CGColor {
        UIColor(hexInt: self).cgColor
    }
}
