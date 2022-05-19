//
//  UIControl+Chain.swift
//  SwiftKit
//
//  Created by Jivan on 2022/5/18.
//

import UIKit

public extension UIControl {
    @discardableResult
    func isEnabled(_ isEnabled: Bool) -> Self {
        self.isEnabled = isEnabled
        return self
    }
    
    @discardableResult
    func isSelected(_ isSelected: Bool) -> Self {
        self.isSelected = isSelected
        return self
    }
    
    @discardableResult
    func isHighlighted(_ isHighlighted: Bool) -> Self {
        self.isHighlighted = isHighlighted
        return self
    }
    
    @discardableResult
    func contentVerticalAlignment(_ contentVerticalAlignment: UIControl.ContentVerticalAlignment) -> Self {
        self.contentVerticalAlignment = contentVerticalAlignment
        return self
    }
    
    @discardableResult
    func contentHorizontalAlignment(_ contentHorizontalAlignment: UIControl.ContentHorizontalAlignment) -> Self {
        self.contentHorizontalAlignment = contentHorizontalAlignment
        return self
    }
}
