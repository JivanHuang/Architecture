//
//  Created by Jivan on 15/09/16.
//  Copyright Jivan. All rights reserved.
//

import CoreGraphics
import Foundation

public extension IntegerLiteralType {
    // swiftlint:disable identifier_name
    /// Map an `IntegerLiteralType` to a `CGFloat`
    var f: CGFloat {
        CGFloat(self)
    }
}

public extension FloatLiteralType {
    /// Map an `FloatLiteralType` to a `CGFloat`
    var f: CGFloat {
        CGFloat(self)
    }
}
