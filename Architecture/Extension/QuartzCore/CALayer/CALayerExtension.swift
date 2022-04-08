//
//  CALayerExtension.swift
//  Architecture
//
//  Created by Jivan on 2021/8/19.
//

import UIKit

// MARK: 自定义链式编程

public extension CALayer {
    /// 设置圆角
    @discardableResult
    func corner(_ cornerRadius: CGFloat) -> Self {
        self.cornerRadius = cornerRadius
        masksToBounds = true
        return self
    }
    
    /// 设置背景色
    @discardableResult
    func backgroundColor(_ color: UIColor) -> Self {
        backgroundColor = color.cgColor
        return self
    }
    
    /// 设置背景色 (十六进制字符串)
    @discardableResult
    func backgroundColor(_ hex: String) -> Self {
        backgroundColor = UIColor.hexStringColor(hexString: hex).cgColor
        return self
    }
    
    /// 设置frame
    @discardableResult
    func frame(_ frame: CGRect) -> Self {
        self.frame = frame
        return self
    }
    
    /// 添加到父视图
    @discardableResult
    func addTo(_ superView: UIView) -> Self {
        superView.layer.addSublayer(self)
        return self
    }
    
    /// 添加到父视图(CALayer)
    @discardableResult
    func addTo(_ superLayer: CALayer) -> Self {
        superLayer.addSublayer(self)
        return self
    }
    
    /// 是否隐藏
    @discardableResult
    func isHidden(_ isHidden: Bool) -> Self {
        self.isHidden = isHidden
        return self
    }
    
    /// 设置边框宽度
    @discardableResult
    func borderWidth(_ width: CGFloat) -> Self {
        borderWidth = width
        return self
    }
    
    /// 设置边框颜色
    @discardableResult
    func borderColor(_ color: UIColor) -> Self {
        borderColor = color.cgColor
        return self
    }
    
    /// 是否开启光栅化
    @discardableResult
    func shouldRasterize(_ rasterize: Bool) -> Self {
        shouldRasterize = rasterize
        return self
    }
    
    /// 设置光栅化比例
    @discardableResult
    func rasterizationScale(_ scale: CGFloat) -> Self {
        rasterizationScale = scale
        shouldRasterize = true
        return self
    }
    
    /// 设置阴影颜色
    @discardableResult
    func shadowColor(_ color: UIColor) -> Self {
        shadowColor = color.cgColor
        return self
    }
    
    /// 设置阴影的透明度，取值范围：0~1
    func shadowOpacity(_ opacity: Float) -> Self {
        shadowOpacity = opacity
        return self
    }
    
    /// 设置阴影的偏移量
    @discardableResult
    func shadowOffset(_ offset: CGSize) -> Self {
        shadowOffset = offset
        return self
    }
    
    /// 设置阴影圆角
    @discardableResult
    func shadowRadius(_ radius: CGFloat) -> Self {
        shadowRadius = radius
        return self
    }
    
    /// 高性能添加阴影路径 Shadow
    @discardableResult
    func shadowPath(_ path: CGPath) -> Self {
        shadowPath = path
        return self
    }
}

// MARK: 有关 CABasicAnimation 动画的扩展

public extension CALayer {
    /// 移动到另外一个 点(point)
    func animationMovePoint(to endPoint: CGPoint,
                            duration: TimeInterval,
                            delay: TimeInterval = 0,
                            repeatNumber: Float = 1,
                            removedOnCompletion: Bool = false,
                            option: CAMediaTimingFunctionName = .default)
    {
        baseBasicAnimation(keyPath: "position", startValue: position, endValue: endPoint, duration: duration, delay: delay, repeatNumber: repeatNumber, removedOnCompletion: removedOnCompletion, option: option)
    }
    
    /// 移动X
    func animationMoveX(moveValue: Any?,
                        duration: TimeInterval = 2.0,
                        delay: TimeInterval = 0,
                        repeatNumber: Float = 1,
                        removedOnCompletion: Bool = false,
                        option: CAMediaTimingFunctionName = .default)
    {
        baseBasicAnimation(keyPath: "transform.translation.x", startValue: position, endValue: moveValue, duration: duration, delay: delay, repeatNumber: repeatNumber, removedOnCompletion: removedOnCompletion, option: option)
    }
    
    /// 移动Y
    func animationMoveY(moveValue: Any?,
                        duration: TimeInterval = 2.0,
                        delay: TimeInterval = 0,
                        repeatNumber: Float = 1,
                        removedOnCompletion: Bool = false,
                        option: CAMediaTimingFunctionName = .default)
    {
        baseBasicAnimation(keyPath: "transform.translation.y", startValue: position, endValue: moveValue, duration: duration, delay: delay, repeatNumber: repeatNumber, removedOnCompletion: removedOnCompletion, option: option)
    }
    
    /// 圆角动画
    func animationCornerRadius(cornerRadius: Any?,
                               duration: TimeInterval = 2.0,
                               delay: TimeInterval = 0,
                               repeatNumber: Float = 1,
                               removedOnCompletion: Bool = false,
                               option: CAMediaTimingFunctionName = .default)
    {
        baseBasicAnimation(keyPath: "cornerRadius", startValue: position, endValue: cornerRadius, duration: duration, delay: delay, repeatNumber: repeatNumber, removedOnCompletion: removedOnCompletion, option: option)
    }
    
    /// 缩放动画
    func animationScale(scaleValue: Any?,
                        duration: TimeInterval = 2.0,
                        delay: TimeInterval = 0,
                        repeatNumber: Float = 1,
                        removedOnCompletion: Bool = true,
                        option: CAMediaTimingFunctionName = .default)
    {
        baseBasicAnimation(keyPath: "transform.scale", startValue: 1, endValue: scaleValue, duration: duration, delay: delay, repeatNumber: repeatNumber, removedOnCompletion: removedOnCompletion, option: option)
    }
    
    /// 缩放动画
    func animationRotation(rotation: Any?,
                           duration: TimeInterval = 2.0,
                           delay: TimeInterval = 0,
                           repeatNumber: Float = 1,
                           removedOnCompletion: Bool = true,
                           option: CAMediaTimingFunctionName = .default)
    {
        baseBasicAnimation(keyPath: "transform.rotation", startValue: nil, endValue: rotation, duration: duration, delay: delay, repeatNumber: repeatNumber, removedOnCompletion: removedOnCompletion, option: option)
    }
    
    /// 动画的 X/Y 移动
    func baseBasicAnimation(keyPath: String,
                            startValue: Any?,
                            endValue: Any?,
                            duration: TimeInterval = 2.0,
                            delay: TimeInterval = 0,
                            repeatNumber: Float = 1,
                            removedOnCompletion: Bool = false,
                            option: CAMediaTimingFunctionName = .default)
    {
        let translatonAnimation = CABasicAnimation()
        // 几秒后执行
        translatonAnimation.beginTime = CACurrentMediaTime() + delay
        // 动画的类型
        translatonAnimation.keyPath = keyPath
        // 起始的值
        if let weakStartValue = startValue {
            translatonAnimation.fromValue = weakStartValue
        }
        // 结束的值
        translatonAnimation.toValue = endValue
        // 动画持续的时间
        translatonAnimation.duration = duration
        // 运动后的位置保持不变（layer的最后位置是toValue）
        translatonAnimation.isRemovedOnCompletion = removedOnCompletion
        // 图层保持动画执行后的状态，前提是fillMode设置为kCAFillModeForwards
        translatonAnimation.fillMode = CAMediaTimingFillMode.forwards
        /**
         linear: 匀速
         easeIn: 慢进
         easeOut: 慢出
         easeInEaseOut: 慢进慢出
         default: 慢进慢出
         */
        translatonAnimation.timingFunction = CAMediaTimingFunction(name: option)
        add(translatonAnimation, forKey: nil)
    }
}

// MARK: 有关 CAKeyframeAnimation 动画的扩展

public extension CALayer {
    /// 设置values使其沿 position 运动 (这里移动是以 视图的 锚点移动的，默认是视图的 中心点)
    func addKeyframeAnimationPosition(values: [Any],
                                      keyTimes: [NSNumber]?,
                                      duration: TimeInterval = 2.0,
                                      delay: TimeInterval = 0,
                                      repeatNumber: Float = 1,
                                      removedOnCompletion: Bool = false,
                                      option: CAMediaTimingFunctionName = .default)
    {
        baseKeyframeAnimation(keyPath: "position", values: values, keyTimes: keyTimes, duration: duration, delay: delay, repeatNumber: repeatNumber, path: nil, removedOnCompletion: removedOnCompletion, option: option)
    }
    
    /// 根据 CGPath 进行做 移动 动画
    func addKeyframeAnimationPositionBezierPath(path: CGPath?,
                                                duration: TimeInterval = 2.0,
                                                delay: TimeInterval = 0,
                                                repeatNumber: Float = 1,
                                                removedOnCompletion: Bool = false,
                                                option: CAMediaTimingFunctionName = .default)
    {
        baseKeyframeAnimation(keyPath: "position", values: nil, keyTimes: nil, duration: duration, delay: delay, repeatNumber: repeatNumber, path: path, removedOnCompletion: removedOnCompletion, option: option)
    }
    
    /// CAKeyframeAnimation 动画的通用方法
    func baseKeyframeAnimation(keyPath: String,
                               values: [Any]?,
                               keyTimes: [NSNumber]?,
                               duration: TimeInterval = 2.0,
                               delay: TimeInterval = 0,
                               repeatNumber: Float = 1,
                               path: CGPath?,
                               removedOnCompletion: Bool = false,
                               option: CAMediaTimingFunctionName = .default)
    {
        let keyframeAnimation = CAKeyframeAnimation(keyPath: keyPath)
        keyframeAnimation.duration = duration
        // 几秒后执行
        keyframeAnimation.beginTime = CACurrentMediaTime() + delay
        keyframeAnimation.isRemovedOnCompletion = removedOnCompletion
        keyframeAnimation.fillMode = .forwards
        keyframeAnimation.repeatCount = repeatNumber
        // 传进来的值，可以是一组 CGPoint
        if let weakValues = values {
            keyframeAnimation.values = weakValues
        }
        if let weakKeyTimes = keyTimes {
            keyframeAnimation.keyTimes = weakKeyTimes
        }
        if let weakPath = path {
            keyframeAnimation.path = weakPath
            // 计算模式 -> 强制运动,匀速进行,不管路径有多远!否则一次动画结束会有短暂停顿
            keyframeAnimation.calculationMode = .cubicPaced
        }
        // 旋转模式 -> 沿着路径,自行旋转 转的时候需要沿着路径的切线!进行转动!
        // keyframeAnimation.rotationMode = .rotateAuto
        //  动画的时间节奏控制 方式
        keyframeAnimation.timingFunction = CAMediaTimingFunction(name: option)
        add(keyframeAnimation, forKey: nil)
    }
}

// MARK: 有关 CATransition 动画的扩展

public extension CALayer {
    /// 转场动画的使用
    func addTransition(type: CATransitionType,
                       subtype: CATransitionSubtype?,
                       duration: CFTimeInterval = 2.0,
                       delay: TimeInterval = 0)
    {
        let transition = CATransition()
        // 几秒后执行
        transition.beginTime = CACurrentMediaTime() + delay
        /**
         过渡动画的类型
         fade: 渐变
         moveIn: 覆盖
         push: 推出
         reveal: 揭开
         还有一些私有动画类型，效果很炫酷，不过不推荐使用。
         　　私有动画类型的值有："cube"、"suckEffect"、"oglFlip"、 "rippleEffect"、"pageCurl"、"pageUnCurl"等等
         */
        transition.type = type
        /**
         fromRight: 从右边
         fromLeft:  从左边
         fromTop: 从顶部
         fromBottom: 从底部
         */
        transition.subtype = .fromLeft
        transition.duration = 1
        add(transition, forKey: nil)
    }
}

// MARK: 有关 CASpringAnimation 弹性动画的扩展

public extension CALayer {
    /// 弹簧动画：Bounds 动画
    func addSpringAnimationBounds(toValue: Any?,
                                  delay: TimeInterval = 0,
                                  mass: CGFloat = 10.0,
                                  stiffness: CGFloat = 5000,
                                  damping: CGFloat = 100.0,
                                  initialVelocity: CGFloat = 5,
                                  repeatNumber: Float = 1,
                                  removedOnCompletion: Bool = false,
                                  option: CAMediaTimingFunctionName = .default)
    {
        baseSpringAnimation(path: "bounds", toValue: toValue, mass: mass, stiffness: stiffness, damping: damping, initialVelocity: initialVelocity, repeatNumber: repeatNumber, removedOnCompletion: removedOnCompletion, option: option)
    }
    
    ///  弹簧的基类动画
    func baseSpringAnimation(path: String?,
                             toValue: Any?,
                             delay: TimeInterval = 0,
                             mass: CGFloat = 10.0,
                             stiffness: CGFloat = 5000,
                             damping: CGFloat = 100.0,
                             initialVelocity: CGFloat = 5,
                             repeatNumber: Float = 1,
                             removedOnCompletion: Bool = false,
                             option: CAMediaTimingFunctionName = .default)
    {
        let springAnimation = CASpringAnimation(keyPath: path)
        // 几秒后执行
        springAnimation.beginTime = CACurrentMediaTime() + delay
        // 质量，影响图层运动时的弹簧惯性，质量越大，弹簧拉伸和压缩的幅度越大
        springAnimation.mass = mass
        // 刚度系数(劲度系数/弹性系数)，刚度系数越大，形变产生的力就越大，运动越快
        springAnimation.stiffness = stiffness
        // 阻尼系数，阻止弹簧伸缩的系数，阻尼系数越大，停止越快
        springAnimation.damping = damping
        // 初始速率，动画视图的初始速度大小;速率为正数时，速度方向与运动方向一致，速率为负数时，速度方向与运动方向相反
        springAnimation.initialVelocity = initialVelocity
        // settlingDuration：结算时间（根据动画参数估算弹簧开始运动到停止的时间，动画设置的时间最好根据此时间来设置）
        springAnimation.duration = springAnimation.settlingDuration
        springAnimation.toValue = toValue
        springAnimation.isRemovedOnCompletion = removedOnCompletion
        springAnimation.fillMode = CAMediaTimingFillMode.forwards
        // 动画的时间节奏控制 方式
        springAnimation.timingFunction = CAMediaTimingFunction(name: option)
        add(springAnimation, forKey: nil)
    }
}

// MARK: 有关 CAAnimationGroup 动画组的扩展

public extension CALayer {
    /// CAAnimationGroup 的基类动画
    func baseAnimationGroup(animations: [CAAnimation]?,
                            duration: TimeInterval = 2.0,
                            delay: TimeInterval = 0,
                            repeatNumber: Float = 1,
                            removedOnCompletion: Bool = false,
                            option: CAMediaTimingFunctionName = .default)
    {
        let animationGroup = CAAnimationGroup()
        // 几秒后执行
        animationGroup.beginTime = CACurrentMediaTime() + delay
        animationGroup.animations = animations
        animationGroup.duration = duration
        animationGroup.fillMode = .forwards
        animationGroup.isRemovedOnCompletion = removedOnCompletion
        // 动画的时间节奏控制 方式
        animationGroup.timingFunction = CAMediaTimingFunction(name: option)
        add(animationGroup, forKey: nil)
    }
}
