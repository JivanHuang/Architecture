//
//  UIImageExtension.swift
//  Architecture
//
//  Created by Jivan on 2021/8/19.
//

import UIKit

// MARK: 基本的扩展

public extension UIImage {
    /// 设置图片的圆角
    func isRoundCorner(radius: CGFloat = 3, byRoundingCorners corners: UIRectCorner = .allCorners, imageSize: CGSize?) -> UIImage? {
        let weakSize = imageSize ?? size
        let rect = CGRect(origin: CGPoint(x: 0, y: 0), size: weakSize)
        // 开始图形上下文
        UIGraphicsBeginImageContextWithOptions(weakSize, false, UIScreen.main.scale)
        guard let contentRef: CGContext = UIGraphicsGetCurrentContext() else {
            // 关闭上下文
            UIGraphicsEndImageContext()
            return nil
        }
        // 绘制路线
        contentRef.addPath(UIBezierPath(roundedRect: rect,
                                        byRoundingCorners: UIRectCorner.allCorners,
                                        cornerRadii: CGSize(width: radius, height: radius)).cgPath)
        // 裁剪
        contentRef.clip()
        // 将原图片画到图形上下文
        draw(in: rect)
        contentRef.drawPath(using: .fillStroke)
        guard let output = UIGraphicsGetImageFromCurrentImageContext() else {
            // 关闭上下文
            UIGraphicsEndImageContext()
            return nil
        }
        // 关闭上下文
        UIGraphicsEndImageContext()
        return output
    }

    //// 设置圆形图片
    func isCircleImage() -> UIImage? {
        return isRoundCorner(radius: (size.width < size.height ? size.width : size.height) / 2.0, byRoundingCorners: .allCorners, imageSize: size)
    }

    /// layer 转 image
    static func image(from layer: CALayer, scale: CGFloat = 0.0) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(layer.frame.size, layer.isOpaque, scale)
        defer {
            UIGraphicsEndImageContext()
        }
        guard let ctx = UIGraphicsGetCurrentContext() else { return nil }
        layer.render(in: ctx)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        return image
    }

    /// 设置图片透明度
    func imageByApplayingAlpha(_ alpha: CGFloat) -> UIImage {
        UIGraphicsBeginImageContext(size)
        let context = UIGraphicsGetCurrentContext()
        let area = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        context?.scaleBy(x: 1, y: -1)
        context?.translateBy(x: 0, y: -area.height)
        context?.setBlendMode(.multiply)
        context?.setAlpha(alpha)
        context?.draw(cgImage!, in: area)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage ?? self
    }

    /// 裁剪给定区域
    func cropWithCropRect(_ crop: CGRect) -> UIImage? {
        let cropRect = CGRect(x: crop.origin.x * scale, y: crop.origin.y * scale, width: crop.size.width * scale, height: crop.size.height * scale)
        if cropRect.size.width <= 0 || cropRect.size.height <= 0 {
            return nil
        }
        var image: UIImage?
        autoreleasepool {
            let imageRef: CGImage? = self.cgImage!.cropping(to: cropRect)
            if let imageRef = imageRef {
                image = UIImage(cgImage: imageRef)
            }
        }
        return image
    }

    /// 给图片添加文字水印
    func drawTextInImage(drawTextframe: CGRect, drawText: String, withAttributes: [NSAttributedString.Key: Any]? = nil) -> UIImage {
        // 开启图片上下文
        UIGraphicsBeginImageContext(size)
        // 图形重绘
        draw(in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        // 水印文字属性
        let attributes = withAttributes
        // 水印文字和大小
        let text = NSString(string: drawText)
        // 获取富文本的 size
        // let size = text.size(withAttributes: attributes)
        // 绘制文字
        text.draw(in: drawTextframe, withAttributes: attributes)
        // 从当前上下文获取图片
        let image = UIGraphicsGetImageFromCurrentImageContext()
        // 关闭上下文
        UIGraphicsEndImageContext()

        return image!
    }
}

// MARK: UIColor 生成纯色图片和渐变色图片

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
                         direction: GradientDirection = .horizontal) -> UIImage? {
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

// MARK: 图片的拉伸和缩放

public extension UIImage {
    /// 获取固定大小的image
    func solidTo(size: CGSize) -> UIImage? {
        let w = size.width
        let h = size.height
        if self.size.height <= self.size.width {
            if self.size.width >= w {
                let scaleImage = fixOrientation().scaleTo(size: CGSize(width: w, height: w * self.size.height / self.size.width))
                return scaleImage
            } else {
                return fixOrientation()
            }
        } else {
            if self.size.height >= h {
                let scaleImage = fixOrientation().scaleTo(size: CGSize(width: h * self.size.width / self.size.height, height: h))
                return scaleImage
            } else {
                return fixOrientation()
            }
        }
    }

    /// 按宽高比系数：等比缩放
    func scaleTo(scale: CGFloat) -> UIImage? {
        let w = size.width
        let h = size.height
        let scaledW = w * scale
        let scaledH = h * scale
        UIGraphicsBeginImageContext(size)
        draw(in: CGRect(x: 0, y: 0, width: scaledW, height: scaledH))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }

    /// 按指定尺寸等比缩放
    func scaleTo(size: CGSize) -> UIImage? {
        if cgImage == nil { return nil }
        var w = CGFloat(cgImage!.width)
        var h = CGFloat(cgImage!.height)
        let verticalRadio = size.height / h
        let horizontalRadio = size.width / w
        var radio: CGFloat = 1
        if verticalRadio > 1 && horizontalRadio > 1 {
            radio = verticalRadio > horizontalRadio ? horizontalRadio : verticalRadio
        } else {
            radio = verticalRadio < horizontalRadio ? verticalRadio : horizontalRadio
        }
        w = w * radio
        h = h * radio
        let xPos = (size.width - w) / 2
        let yPos = (size.height - h) / 2
        UIGraphicsBeginImageContext(size)
        draw(in: CGRect(x: xPos, y: yPos, width: w, height: h))
        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return scaledImage
    }

    /// 图片中间1*1拉伸——如气泡一般
    func strechAsBubble() -> UIImage {
        let top = size.height * 0.5
        let left = size.width * 0.5
        let bottom = size.height * 0.5
        let right = size.width * 0.5
        let edgeInsets = UIEdgeInsets(top: top, left: left, bottom: bottom, right: right)
        // 拉伸
        return resizableImage(withCapInsets: edgeInsets, resizingMode: .stretch)
    }

    /// 调整图像方向 避免图像有旋转
    func fixOrientation() -> UIImage {
        if imageOrientation == .up {
            return self
        }
        var transform: CGAffineTransform = CGAffineTransform.identity
        switch imageOrientation {
        case .down, .downMirrored:
            transform = transform.translatedBy(x: size.width, y: size.height)
            transform = transform.rotated(by: .pi)
        case .left, .leftMirrored:
            transform = transform.translatedBy(x: size.width, y: 0)
            transform = transform.rotated(by: .pi / 2)
        case .right, .rightMirrored:
            transform = transform.translatedBy(x: 0, y: size.height)
            transform = transform.rotated(by: -.pi / 2)
        default:
            break
        }
        switch imageOrientation {
        case .upMirrored, .downMirrored:
            transform.translatedBy(x: size.width, y: 0)
            transform.scaledBy(x: -1, y: 1)
        case .leftMirrored, .rightMirrored:
            transform.translatedBy(x: size.height, y: 0)
            transform.scaledBy(x: -1, y: 1)
        default:
            break
        }
        let ctx: CGContext = CGContext(data: nil, width: Int(size.width), height: Int(size.height), bitsPerComponent: (self.cgImage?.bitsPerComponent)!, bytesPerRow: 0, space: (self.cgImage?.colorSpace)!, bitmapInfo: CGImageAlphaInfo.premultipliedLast.rawValue)!
        ctx.concatenate(transform)
        switch imageOrientation {
        case .left, .leftMirrored, .right, .rightMirrored:
            ctx.draw(self.cgImage!, in: CGRect(x: 0, y: 0, width: size.height, height: size.width))
        default:
            ctx.draw(self.cgImage!, in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        }
        let cgImage: CGImage = ctx.makeImage()!
        return UIImage(cgImage: cgImage)
    }
}
