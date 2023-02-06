//
//  UIView+Layout.swift
//  Architecture
//
//  Created by Jivan on 2023/1/16.
//

#if canImport(UIKit)
import UIKit

public extension UIView {
    /// 设置autoresizingMask
    @discardableResult
    @available(iOS 6.0, *)
    func autoresizingMask(_ autoresizingMask: Bool) -> Self {
        translatesAutoresizingMaskIntoConstraints = autoresizingMask
        return self
    }
}

// AutoLayout
@available(iOS 9.0, *)
public extension UIView {
    @discardableResult
    func anchorCenterXToSuperview(constant: CGFloat = 0) -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        if let anchor = superview?.centerXAnchor {
            centerXAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        }
        return self
    }

    @discardableResult
    func anchorCenterYToSuperview(constant: CGFloat = 0) -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        if let anchor = superview?.centerYAnchor {
            centerYAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        }
        return self
    }

    @discardableResult
    func anchorCenterSuperview() -> Self {
        anchorCenterXToSuperview()
        anchorCenterYToSuperview()
        return self
    }

    @discardableResult
    func topAnchor(attribute: NSLayoutYAxisAnchor, constant: CGFloat = 0.0) -> Self {
        topAnchor.constraint(equalTo: attribute, constant: constant).isActive = true
        return self
    }

    @discardableResult
    func leftAnchor(attribute: NSLayoutXAxisAnchor, constant: CGFloat = 0.0) -> Self {
        leftAnchor.constraint(equalTo: attribute, constant: constant).isActive = true
        return self
    }

    @discardableResult
    func leadingAnchor(attribute: NSLayoutXAxisAnchor, constant: CGFloat = 0.0) -> Self {
        leadingAnchor.constraint(equalTo: attribute, constant: constant).isActive = true
        return self
    }

    @discardableResult
    func bottomAnchor(attribute: NSLayoutYAxisAnchor, constant: CGFloat = 0.0) -> Self {
        bottomAnchor.constraint(equalTo: attribute, constant: constant).isActive = true
        return self
    }

    @discardableResult
    func rightAnchor(attribute: NSLayoutXAxisAnchor, constant: CGFloat = 0.0) -> Self {
        rightAnchor.constraint(equalTo: attribute, constant: constant).isActive = true
        return self
    }

    @discardableResult
    func trailingAnchor(attribute: NSLayoutXAxisAnchor, constant: CGFloat = 0.0) -> Self {
        trailingAnchor.constraint(equalTo: attribute, constant: constant).isActive = true
        return self
    }

    @discardableResult
    func widthAnchor(attribute: NSLayoutDimension, m multiplier: CGFloat = 1.0, constant: CGFloat = 0.0) -> Self {
        widthAnchor.constraint(equalTo: attribute, multiplier: multiplier, constant: constant).isActive = true
        return self
    }

    @discardableResult
    func widthAnchor(greaterThanOrEqualTo attribute: NSLayoutDimension, m multiplier: CGFloat = 1.0, constant: CGFloat = 0.0) -> Self {
        widthAnchor.constraint(greaterThanOrEqualTo: attribute, multiplier: multiplier, constant: constant).isActive = true
        return self
    }

    @discardableResult
    func widthAnchor(lessThanOrEqualTo attribute: NSLayoutDimension, m multiplier: CGFloat = 1.0, constant: CGFloat = 0.0) -> Self {
        widthAnchor.constraint(lessThanOrEqualTo: attribute, multiplier: multiplier, constant: constant).isActive = true
        return self
    }

    @discardableResult
    func widthAnchor(equalToConstant constant: CGFloat = 0.0) -> Self {
        widthAnchor.constraint(equalToConstant: constant).isActive = true
        return self
    }

    @discardableResult
    func heightAnchor(attribute: NSLayoutDimension, m multiplier: CGFloat = 1.0, constant: CGFloat = 0.0) -> Self {
        heightAnchor.constraint(equalTo: attribute, multiplier: multiplier, constant: constant).isActive = true
        return self
    }

    @discardableResult
    func heightAnchor(greaterThanOrEqualTo attribute: NSLayoutDimension, m multiplier: CGFloat = 1.0, constant: CGFloat = 0.0) -> Self {
        heightAnchor.constraint(greaterThanOrEqualTo: attribute, multiplier: multiplier, constant: constant).isActive = true
        return self
    }

    @discardableResult
    func heightAnchor(lessThanOrEqualTo attribute: NSLayoutDimension, m multiplier: CGFloat = 1.0, constant: CGFloat = 0.0) -> Self {
        heightAnchor.constraint(lessThanOrEqualTo: attribute, multiplier: multiplier, constant: constant).isActive = true
        return self
    }

    @discardableResult
    func heightAnchor(equalToConstant constant: CGFloat = 0.0) -> Self {
        heightAnchor.constraint(equalToConstant: constant).isActive = true
        return self
    }

    @discardableResult
    func centerXAnchor(attribute: NSLayoutXAxisAnchor, constant: CGFloat = 0.0) -> Self {
        centerXAnchor.constraint(equalTo: attribute, constant: constant).isActive = true
        return self
    }

    @discardableResult
    func centerYAnchor(attribute: NSLayoutYAxisAnchor, constant: CGFloat = 0.0) -> Self {
        centerYAnchor.constraint(equalTo: attribute, constant: constant).isActive = true
        return self
    }
}

public extension UIView {
    @available(iOS 11.0, *)
    @discardableResult
    func centerYAnchor(equalToSystemSpacingBelow attribute: NSLayoutYAxisAnchor, multiplier: CGFloat = 1.0) -> Self {
        centerYAnchor.constraint(equalToSystemSpacingBelow: attribute, multiplier: multiplier).isActive = true
        return self
    }

    @available(iOS 11.0, *)
    @discardableResult
    func centerXAnchor(equalToSystemSpacingAfter attribute: NSLayoutXAxisAnchor, multiplier: CGFloat = 1.0) -> Self {
        centerXAnchor.constraint(equalToSystemSpacingAfter: attribute, multiplier: multiplier).isActive = true
        return self
    }
}

// MARK: - Constraints

@available(iOS 9.0, *)
public extension UIView {
    /// Search constraints until we find one for the given view
    func findConstraint(attribute: NSLayoutConstraint.Attribute, for view: UIView) -> NSLayoutConstraint? {
        let constraint = constraints.first {
            ($0.firstAttribute == attribute && $0.firstItem as? UIView == view) ||
                ($0.secondAttribute == attribute && $0.secondItem as? UIView == view)
        }
        return constraint ?? superview?.findConstraint(attribute: attribute, for: view)
    }

    /// First width constraint for this view.
    var widthConstraint: NSLayoutConstraint? {
        findConstraint(attribute: .width, for: self)
    }

    /// First height constraint for this view.
    var heightConstraint: NSLayoutConstraint? {
        findConstraint(attribute: .height, for: self)
    }

    /// First leading constraint for this view.
    var leadingConstraint: NSLayoutConstraint? {
        findConstraint(attribute: .leading, for: self)
    }

    /// First trailing constraint for this view.
    var trailingConstraint: NSLayoutConstraint? {
        findConstraint(attribute: .trailing, for: self)
    }

    /// First top constraint for this view.
    var topConstraint: NSLayoutConstraint? {
        findConstraint(attribute: .top, for: self)
    }

    /// First left constraint for this view.
    var leftConstraint: NSLayoutConstraint? {
        findConstraint(attribute: .left, for: self)
    }

    /// First bottom constraint for this view.
    var bottomConstraint: NSLayoutConstraint? {
        findConstraint(attribute: .bottom, for: self)
    }

    /// First right constraint for this view.
    var rightConstraint: NSLayoutConstraint? {
        findConstraint(attribute: .right, for: self)
    }

    /// First centerX constraint for this view.
    var centerXConstraint: NSLayoutConstraint? {
        findConstraint(attribute: .centerX, for: self)
    }

    /// First centerY constraint for this view.
    var centerYConstraint: NSLayoutConstraint? {
        findConstraint(attribute: .centerY, for: self)
    }
}

#endif
