//
//  String+Size.swift
//  Architecture
//
//  Created by Jivan on 2023/1/6.
//  Copyright © 2023 Jivan. All rights reserved.
//

#if canImport(Foundation)

import Foundation
import UIKit

public extension String {
    func boundingWidth(height: CGFloat, options: NSStringDrawingOptions = [.usesLineFragmentOrigin], attributes: [NSAttributedString.Key: Any]? = nil, context: NSStringDrawingContext? = nil) -> CGFloat {
        return NSString(string: self).boundingRect(with: .init(width: CGFLOAT_MAX, height: height), options: options, attributes: attributes, context: context).size.width
    }

    func boundingHeight(width: CGFloat, options: NSStringDrawingOptions = [.usesLineFragmentOrigin], attributes: [NSAttributedString.Key: Any]? = nil, context: NSStringDrawingContext? = nil) -> CGFloat {
        return NSString(string: self).boundingRect(with: .init(width: width, height: CGFLOAT_MAX), options: options, attributes: attributes, context: context).size.height
    }

    func boundingRect(with size: CGSize, options: NSStringDrawingOptions = [.usesLineFragmentOrigin], attributes: [NSAttributedString.Key: Any]? = nil, context: NSStringDrawingContext? = nil) -> CGRect {
        return NSString(string: self).boundingRect(with: size, options: options, attributes: attributes, context: context)
    }
}
#endif
