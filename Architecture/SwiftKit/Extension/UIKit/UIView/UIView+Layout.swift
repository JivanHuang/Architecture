//
//  UIView+Layout.swift
//  Architecture
//
//  Created by Jivan on 2023/1/16.
//

#if canImport(UIKit)
import UIKit

public extension UIView {
    /// translatesAutoresizingMaskIntoConstraints
    @discardableResult
    func autoresizingMask(_ autoresizingMask: Bool) -> Self {
        translatesAutoresizingMaskIntoConstraints = autoresizingMask
        return self
    }
}

// AutoLayout
public extension UIView {
    /// Add anchors from any side of the current view into the specified anchors and returns the newly added constraints.
    @discardableResult
    func anchor(
        top: NSLayoutYAxisAnchor? = nil,
        left: NSLayoutXAxisAnchor? = nil,
        bottom: NSLayoutYAxisAnchor? = nil,
        right: NSLayoutXAxisAnchor? = nil,
        topConstant: CGFloat = 0,
        leftConstant: CGFloat = 0,
        bottomConstant: CGFloat = 0,
        rightConstant: CGFloat = 0,
        widthConstant: CGFloat = 0,
        heightConstant: CGFloat = 0) -> [NSLayoutConstraint]
    {
        translatesAutoresizingMaskIntoConstraints = false

        var anchors = [NSLayoutConstraint]()

        if let top = top {
            anchors.append(topAnchor.constraint(equalTo: top, constant: topConstant))
        }

        if let left = left {
            anchors.append(leftAnchor.constraint(equalTo: left, constant: leftConstant))
        }

        if let bottom = bottom {
            anchors.append(bottomAnchor.constraint(equalTo: bottom, constant: -bottomConstant))
        }

        if let right = right {
            anchors.append(rightAnchor.constraint(equalTo: right, constant: -rightConstant))
        }

        if widthConstant > 0 {
            anchors.append(widthAnchor.constraint(equalToConstant: widthConstant))
        }

        if heightConstant > 0 {
            anchors.append(heightAnchor.constraint(equalToConstant: heightConstant))
        }

        anchors.forEach { $0.isActive = true }

        return anchors
    }

    /// Anchor center X into current view's superview with a constant margin value.
    @discardableResult
    func anchorCenterXToSuperview(constant: CGFloat = 0) -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        if let anchor = superview?.centerXAnchor {
            centerXAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        }
        return self
    }

    /// Anchor center Y into current view's superview with a constant margin value.
    @discardableResult
    func anchorCenterYToSuperview(constant: CGFloat = 0) -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        if let anchor = superview?.centerYAnchor {
            centerYAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        }
        return self
    }

    /// Anchor center X and Y into current view's superview.
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
    func heightAnchor(attribute: NSLayoutDimension, m multiplier: CGFloat = 1.0, constant: CGFloat = 0.0) -> Self {
        heightAnchor.constraint(equalTo: attribute, multiplier: multiplier, constant: constant).isActive = true
        return self
    }
}

// MARK: - Constraints

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
}

#endif
