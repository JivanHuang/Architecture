//
//  UIViewExtension.swift
//  Architecture
//
//  Created by Jivan on 2021/8/19.
//

import UIKit

// MARK: Frame

extension UIView {
    /// Get or set the NSView's frame `x` value.
    public var x: CGFloat {
        get { frame.x }
        set { frame = frame.with(x: newValue) }
    }

    /// Get or set the NSView's frame `y` value.
    public var y: CGFloat {
        get { frame.y }
        set { frame = frame.with(y: newValue) }
    }

    /// Get or set the NSView's frame `width` value.
    public var width: CGFloat {
        get { frame.width }
        set { frame = frame.with(width: newValue) }
    }

    /// Get or set the NSView's frame `height` value.
    public var height: CGFloat {
        get { frame.height }
        set { frame = frame.with(height: newValue) }
    }
}

extension UIView {
    /// 同时添加多个子控件
    ///
    /// - Parameter subviews: 单个或多个子控件
    func add(_ subviews: UIView...) {
        subviews.forEach(addSubview)
    }
}

// MARK: 手势

public typealias GestureClosures = (UIGestureRecognizer) -> Void
private var gestureDictKey: Void?

extension UIView {
    private enum GestureType: String {
        case tapGesture
        case pinchGesture
        case rotationGesture
        case swipeGesture
        case panGesture
        case longPressGesture
    }

    private var gestureDict: [String: GestureClosures]? {
        get {
            return objc_getAssociatedObject(self, &gestureDictKey) as? [String: GestureClosures]
        }
        set {
            objc_setAssociatedObject(self, &gestureDictKey, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
    }

    /// 点击
    @discardableResult
    public func addTapGesture(_ gesture: @escaping GestureClosures) -> UIView {
        addGesture(gesture: gesture, for: .tapGesture)
        return self
    }

    /// 捏合
    @discardableResult
    public func addPinchGesture(_ gesture: @escaping GestureClosures) -> UIView {
        addGesture(gesture: gesture, for: .pinchGesture)
        return self
    }

    /// 旋转
    @discardableResult
    public func addRotationGesture(_ gesture: @escaping GestureClosures) -> UIView {
        addGesture(gesture: gesture, for: .rotationGesture)
        return self
    }

    /// 滑动
    @discardableResult
    public func addSwipeGesture(_ gesture: @escaping GestureClosures) -> UIView {
        addGesture(gesture: gesture, for: .swipeGesture)
        return self
    }

    /// 拖动
    @discardableResult
    public func addPanGesture(_ gesture: @escaping GestureClosures) -> UIView {
        addGesture(gesture: gesture, for: .panGesture)
        return self
    }

    /// 长按
    @discardableResult
    public func addLongPressGesture(_ gesture: @escaping GestureClosures) -> UIView {
        addGesture(gesture: gesture, for: .longPressGesture)
        return self
    }

    // 私有方法
    private func addGesture(gesture: @escaping GestureClosures, for gestureType: GestureType) {
        let gestureKey = String(gestureType.rawValue)
        if var gestureDict = self.gestureDict {
            gestureDict.updateValue(gesture, forKey: gestureKey)
            self.gestureDict = gestureDict
        } else {
            gestureDict = [gestureKey: gesture]
        }
        isUserInteractionEnabled = true
        switch gestureType {
        case .tapGesture:
            let tap = UITapGestureRecognizer(target: self, action: #selector(tapGestureAction(_:)))
            addGestureRecognizer(tap)
        case .pinchGesture:
            let pinch = UIPinchGestureRecognizer(target: self, action: #selector(pinchGestureAction(_:)))
            addGestureRecognizer(pinch)
        case .rotationGesture:
            let rotation = UIRotationGestureRecognizer(target: self, action: #selector(rotationGestureAction(_:)))
            addGestureRecognizer(rotation)
        case .swipeGesture:
            let swipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeGestureAction(_:)))
            addGestureRecognizer(swipe)
        case .panGesture:
            let pan = UIPanGestureRecognizer(target: self, action: #selector(panGestureAction(_:)))
            addGestureRecognizer(pan)
        case .longPressGesture:
            let longPress = UILongPressGestureRecognizer(target: self, action: #selector(longPressGestureAction(_:)))
            addGestureRecognizer(longPress)
        }
    }

    @objc private func tapGestureAction(_ tap: UITapGestureRecognizer) {
        executeGestureAction(.tapGesture, gesture: tap)
    }

    @objc private func pinchGestureAction(_ pinch: UIPinchGestureRecognizer) {
        executeGestureAction(.pinchGesture, gesture: pinch)
    }

    @objc private func rotationGestureAction(_ rotation: UIRotationGestureRecognizer) {
        executeGestureAction(.rotationGesture, gesture: rotation)
    }

    @objc private func swipeGestureAction(_ swipe: UISwipeGestureRecognizer) {
        executeGestureAction(.swipeGesture, gesture: swipe)
    }

    @objc private func panGestureAction(_ pan: UIPanGestureRecognizer) {
        executeGestureAction(.panGesture, gesture: pan)
    }

    @objc private func longPressGestureAction(_ longPress: UILongPressGestureRecognizer) {
        executeGestureAction(.longPressGesture, gesture: longPress)
    }

    private func executeGestureAction(_ gestureType: GestureType, gesture: UIGestureRecognizer) {
        let gestureKey = String(gestureType.rawValue)
        if let gestureDict = self.gestureDict, let gestureReg = gestureDict[gestureKey] {
            gestureReg(gesture)
        }
    }
}

// MARK: 自定义链式编程

public extension UIView {
    /// 设置 tag 值
    @discardableResult
    func tag(_ tag: Int) -> Self {
        self.tag = tag
        return self
    }

    /// 设置圆角
    @discardableResult
    func corner(_ cornerRadius: CGFloat) -> Self {
        layer.cornerRadius = cornerRadius
        layer.masksToBounds = true
        return self
    }

    /// 图片的模式
    @discardableResult
    func contentMode(_ mode: UIView.ContentMode) -> Self {
        contentMode = mode
        return self
    }

    /// 设置背景色
    @discardableResult
    func backgroundColor(_ color: UIColor) -> Self {
        backgroundColor = color
        return self
    }

    /// 设置十六进制颜色
    @discardableResult
    func backgroundColor(_ hex: String) -> Self {
        backgroundColor = UIColor.hexStringColor(hexString: hex)
        return self
    }

    /// 设置 frame
    @discardableResult
    func frame(_ frame: CGRect) -> Self {
        self.frame = frame
        return self
    }

    /// 被添加到某个视图上
    @discardableResult
    func addTo(_ superView: UIView) -> Self {
        superView.addSubview(self)
        return self
    }

    /// 设置是否支持触摸
    @discardableResult
    func isUserInteractionEnabled(_ isUserInteractionEnabled: Bool) -> Self {
        self.isUserInteractionEnabled = isUserInteractionEnabled
        return self
    }

    /// 设置是否隐藏
    @discardableResult
    func isHidden(_ isHidden: Bool) -> Self {
        self.isHidden = isHidden
        return self
    }

    /// 设置透明度
    @discardableResult
    func alpha(_ alpha: CGFloat) -> Self {
        self.alpha = alpha
        return self
    }

    /// 设置tintColor
    @discardableResult
    func tintColor(_ tintColor: UIColor) -> Self {
        self.tintColor = tintColor
        return self
    }
}

// MARK: Borders

extension UIView {
    private static let borderSideLayerId = "swiftyutils_borderSideLayer"

    public func addBorders(to edges: UIRectEdge, borderColor: UIColor, borderWidth: CGFloat) {
        clearLayer()
        drawBordersSides(to: edges, borderColor: borderColor, borderWidth: borderWidth)
    }

    private func clearLayer() {
        layer.borderColor = nil
        layer.borderWidth = 0
        layer.sublayers?
            .filter { $0.name == Self.borderSideLayerId }
            .forEach { $0.removeFromSuperlayer() }
    }

    private func drawBordersSides(to edges: UIRectEdge, borderColor: UIColor, borderWidth: CGFloat) {
        let shapeLayer = CAShapeLayer()
        shapeLayer.name = Self.borderSideLayerId
        shapeLayer.path = makeBorderPath(to: edges, borderWidth: borderWidth).cgPath
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = borderColor.cgColor
        shapeLayer.lineWidth = borderWidth
        shapeLayer.frame = bounds
        layer.masksToBounds = true
        layer.insertSublayer(shapeLayer, at: 0)
    }

    private func makeBorderPath(to edges: UIRectEdge, borderWidth: CGFloat) -> UIBezierPath {
        let lines = makeLines(to: edges, borderWidth: borderWidth)
        let borderPath = UIBezierPath()
        lines.forEach {
            borderPath.move(to: $0.start)
            borderPath.addLine(to: $0.end)
        }
        return borderPath
    }

    private func makeLines(to edges: UIRectEdge, borderWidth: CGFloat) -> [(start: CGPoint, end: CGPoint)] {
        let shift = borderWidth / 2
        var lines = [(start: CGPoint, end: CGPoint)]()
        if edges.contains(.top) {
            lines.append((start: CGPoint(x: 0, y: shift), end: CGPoint(x: bounds.size.width, y: shift)))
        }
        if edges.contains(.right) {
            lines.append((start: CGPoint(x: bounds.size.width - shift, y: 0),
                          end: CGPoint(x: bounds.size.width - shift, y: bounds.size.height)))
        }
        if edges.contains(.bottom) {
            lines.append((start: CGPoint(x: 0, y: bounds.size.height - shift),
                          end: CGPoint(x: bounds.size.width, y: bounds.size.height - shift)))
        }
        if edges.contains(.left) {
            lines.append((start: CGPoint(x: shift, y: 0),
                          end: CGPoint(x: shift, y: bounds.size.height)))
        }
        return lines
    }
}
