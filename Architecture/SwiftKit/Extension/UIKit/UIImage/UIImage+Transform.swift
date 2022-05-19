//
//  UIImage+transform.swift
//  SwiftKit
//
//  Created by Jivan on 2022/5/17.
//

import UIKit

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
        if verticalRadio > 1, horizontalRadio > 1 {
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
        var transform = CGAffineTransform.identity
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
        let ctx = CGContext(data: nil, width: Int(size.width), height: Int(size.height), bitsPerComponent: (self.cgImage?.bitsPerComponent)!, bytesPerRow: 0, space: (self.cgImage?.colorSpace)!, bitmapInfo: CGImageAlphaInfo.premultipliedLast.rawValue)!
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
