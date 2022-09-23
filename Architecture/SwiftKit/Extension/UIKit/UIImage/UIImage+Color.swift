//
//  UIImage+Color.swift
//  SwiftKit
//
//  Created by Jivan on 2022/5/17.
//

#if canImport(UIKit)
import UIKit

public extension UIImage {
    /// 生成指定尺寸的纯色图像
    static func image(color: UIColor, size: CGSize = CGSize(width: 1.0, height: 1.0)) -> UIImage? {
        return image(color: color, size: size, corners: .allCorners, radius: 0)
    }

    /// 生成指定尺寸和圆角的纯色图像
    static func image(color: UIColor, size: CGSize, corners: UIRectCorner, radius: CGFloat) -> UIImage? {
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        UIGraphicsBeginImageContextWithOptions(size, false, UIScreen.main.scale)
        let context = UIGraphicsGetCurrentContext()
        if radius > 0 {
            let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
            color.setFill()
            path.fill()
        } else {
            context?.setFillColor(color.cgColor)
            context?.fill(rect)
        }
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return img
    }
}

public extension UIImage {
    enum GradientDirection {
        case horizontal // 水平从左到右
        case vertical // 垂直从上到下
        case leftOblique // 左上到右下
        case rightOblique // 右上到左下
        case other(CGPoint, CGPoint)

        public func point(size: CGSize) -> (CGPoint, CGPoint) {
            switch self {
            case .horizontal:
                return (CGPoint(x: 0, y: 0), CGPoint(x: size.width, y: 0))
            case .vertical:
                return (CGPoint(x: 0, y: 0), CGPoint(x: 0, y: size.height))
            case .leftOblique:
                return (CGPoint(x: 0, y: 0), CGPoint(x: size.width, y: size.height))
            case .rightOblique:
                return (CGPoint(x: size.width, y: 0), CGPoint(x: 0, y: size.height))
            case let .other(stat, end):
                return (stat, end)
            }
        }
    }

    /// 生成渐变色的图片 ["#B0E0E6", "#00CED1", "#2E8B57"]
    static func gradient(_ hexsString: [String], size: CGSize = CGSize(width: 1, height: 1), locations: [CGFloat]? = nil, direction: GradientDirection = .horizontal) -> UIImage? {
        return gradient(hexsString.map { UIColor.hexStringColor(hexString: $0) }, size: size, locations: locations, direction: direction)
    }

    /// 生成渐变色的图片 [UIColor, UIColor, UIColor]
    static func gradient(_ colors: [UIColor], size: CGSize = CGSize(width: 10, height: 10), locations: [CGFloat]? = nil, direction: GradientDirection = .horizontal) -> UIImage? {
        return gradient(colors, size: size, radius: 0, locations: locations, direction: direction)
    }

    /// 生成带圆角渐变色的图片 [UIColor, UIColor, UIColor]
    static func gradient(_ colors: [UIColor],
                         size: CGSize = CGSize(width: 10, height: 10),
                         radius: CGFloat,
                         locations: [CGFloat]? = nil,
                         direction: GradientDirection = .horizontal) -> UIImage?
    {
        if colors.count == 0 { return nil }
        if colors.count == 1 {
            return UIImage.image(color: colors[0])
        }
        UIGraphicsBeginImageContext(size)
        let context = UIGraphicsGetCurrentContext()
        let path = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: size.width, height: size.height), cornerRadius: radius)
        path.addClip()
        context?.addPath(path.cgPath)
        guard let gradient = CGGradient(colorsSpace: CGColorSpaceCreateDeviceRGB(), colors: colors.map { $0.cgColor } as CFArray, locations: locations?.map { CGFloat($0) }) else { return nil
        }
        let directionPoint = direction.point(size: size)
        context?.drawLinearGradient(gradient, start: directionPoint.0, end: directionPoint.1, options: .drawsBeforeStartLocation)

        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}
#endif
