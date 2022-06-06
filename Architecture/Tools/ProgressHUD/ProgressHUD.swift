//
//  ProgressHUD.swift
//  Architecture
//
//  Created by Jivan on 2022/5/31.
//

import Foundation
import UIKit

public enum ProgressHUDMode {
    case text
    case systemActivityIndicator
}

public enum ProgressAnimationType {
    case fade
    case zoom
}

public enum ProgressIcon {
    case none
    case succeed
    case failed
    case warn
    case custom(_ name: String)
}

public enum ProgressBackgroundStyle {
    case solid
    case blur(style: UIBlurEffect.Style)
}

public extension ProgressHUD {
    class var colorBackground: UIColor {
        get { shared.colorBackground }
        set { shared.colorBackground = newValue }
    }
    
    class var colorHUD: UIColor {
        get { shared.colorHUD }
        set { shared.colorHUD = newValue }
    }
    
    class var colorTint: UIColor {
        get { shared.colorTint }
        set { shared.colorTint = newValue }
    }
    
    class var fontStatus: UIFont {
        get { shared.fontStatus }
        set { shared.fontStatus = newValue }
    }
    
    class var indicatorViewStyle: UIActivityIndicatorView.Style {
        get { shared.indicatorViewStyle }
        set { shared.indicatorViewStyle = newValue }
    }
    
    class var animationType: ProgressAnimationType {
        get { shared.animationType }
        set { shared.animationType = newValue }
    }
    
    class var styleBackground: ProgressBackgroundStyle {
        get { shared.styleBackground }
        set { shared.styleBackground = newValue }
    }
}

public extension ProgressHUD {
    class func dismiss() {
        DispatchQueue.main.async {
            shared.hudHide()
        }
    }
    
    class func show(_ status: String? = nil, interaction: Bool = true) {
        DispatchQueue.main.async {
            shared.setup(status: status, mode: .systemActivityIndicator, hide: false, interaction: interaction)
        }
    }
    
    class func showSucceed(_ status: String? = nil, interaction: Bool = true) {
        DispatchQueue.main.async {
            showInfo(status, icon: .succeed, interaction: interaction)
        }
    }
    
    class func showFailed(_ status: String? = nil, interaction: Bool = true) {
        DispatchQueue.main.async {
            showInfo(status, icon: .failed, interaction: interaction)
        }
    }

    class func showWarn(_ status: String? = nil, interaction: Bool = true) {
        DispatchQueue.main.async {
            showInfo(status, icon: .warn, interaction: interaction)
        }
    }
    
    class func showInfo(_ status: String? = nil, icon: ProgressIcon = .none, hide: Bool = true, interaction: Bool = true) {
        var image: UIImage?
        switch icon {
        case .succeed:
            image = hudImage(name: "succeed")
        case .failed:
            image = hudImage(name: "failed")
        case .warn:
            image = hudImage(name: "warn")
        case .custom(let name):
            image = hudImage(name: name)
        case .none:
            image = nil
        }
        DispatchQueue.main.async {
            shared.setup(status: status, mode: .text, staticImage: image, hide: hide, interaction: interaction)
        }
    }
}

public class ProgressHUD: UIView {
    private var viewBackground: UIView?
    private var colorBackground = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
    private var styleBackground: ProgressBackgroundStyle = .solid
    private var toolbarHUD: UIView?
    private var indicatorView: UIActivityIndicatorView?
    private var indicatorViewStyle: UIActivityIndicatorView.Style = {
        if #available(iOS 13.0, *) {
            return UIActivityIndicatorView.Style.large
        } else {
            return UIActivityIndicatorView.Style.gray
        }
    }()
    
    private var colorHUD: UIColor = .white
    private var labelStatus: UILabel?
    private var colorStatus = UIColor.label
    private var fontStatus = UIFont.boldSystemFont(ofSize: 18)
    private var staticImageView: UIImageView?
    private var colorTint: UIColor = .black
    private var timer: Timer?
    private var animationType: ProgressAnimationType = .fade
    static let shared: ProgressHUD = .init()
    
    private convenience init() {
        self.init(frame: UIScreen.main.bounds)
        self.alpha = 0
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override private init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    private func setup(status: String? = nil, mode: ProgressHUDMode? = .text, staticImage: UIImage? = nil, customView: UIView? = nil, hide: Bool, interaction: Bool) {
        setupBackground(interaction)
        setupToolbar()
        if mode == .systemActivityIndicator { setupIndicatorView() }
        if staticImage != nil { setupStaticImageIcon(staticImage) }
        setupLabel(status)
        setupSize()
        setupPosition()
        
        hudShow()
        if hide {
            let text = labelStatus?.text ?? ""
            let delay = Double(text.count) * 0.03 + 1.25
            timer = Timer.scheduledTimer(withTimeInterval: delay, repeats: false) { _ in
                self.hudHide()
            }
        }
    }
    
    private func setupBackground(_ interaction: Bool) {
        if viewBackground == nil {
            let mainWindow = UIApplication.shared.windows.first ?? UIWindow()
            viewBackground = UIView(frame: mainWindow.bounds)
            mainWindow.addSubview(viewBackground!)
        }
        viewBackground?.backgroundColor = interaction ? .clear : colorBackground
        viewBackground?.isUserInteractionEnabled = (interaction == false)
        viewBackground?.subviews
            .filter { $0.isKind(of: UIVisualEffectView.self) }
            .forEach { $0.removeFromSuperview() }
        switch styleBackground {
        case .blur(let style):
            let blurView = UIVisualEffectView(effect: UIBlurEffect(style: style))
            toolbarHUD?.addSubview(blurView)
        default: break
        }
    }
    
    private func setupToolbar() {
        if toolbarHUD == nil {
            toolbarHUD = UIView(frame: CGRect.zero)
            toolbarHUD?.clipsToBounds = true
            toolbarHUD?.layer.cornerRadius = 10
            toolbarHUD?.layer.masksToBounds = true
            viewBackground?.addSubview(toolbarHUD!)
        }
        
        toolbarHUD?.backgroundColor = colorHUD
    }
    
    private func setupLabel(_ status: String?) {
        if labelStatus == nil {
            labelStatus = UILabel()
            labelStatus?.textAlignment = .center
            labelStatus?.baselineAdjustment = .alignCenters
            labelStatus?.numberOfLines = 0
            toolbarHUD?.addSubview(labelStatus!)
        }
        
        labelStatus?.text = (status != "") ? status : nil
        labelStatus?.font = fontStatus
        labelStatus?.textColor = colorTint
        labelStatus?.isHidden = (status == nil) ? true : false
    }
    
    private func setupIndicatorView() {
        staticImageView?.removeFromSuperview()
        if indicatorView == nil {
            indicatorView = UIActivityIndicatorView()
            indicatorView?.style = indicatorViewStyle
        }
        if indicatorView?.superview == nil {
            toolbarHUD?.addSubview(indicatorView!)
        }
        indicatorView?.startAnimating()
    }
    
    private func setupStaticImageIcon(_ staticImage: UIImage?) {
        indicatorView?.removeFromSuperview()
        if staticImageView == nil {
            staticImageView = .init(frame: .init(origin: .zero, size: .init(width: 28, height: 28)))
        }
        
        if staticImageView?.superview == nil {
            toolbarHUD?.addSubview(staticImageView!)
        }
        staticImageView?.image = staticImage?.withTintColor(colorTint, renderingMode: .alwaysTemplate)
        staticImageView?.tintColor = colorTint
        staticImageView?.contentMode = .scaleAspectFit
    }
    
    private func setupSize() {
        var width: CGFloat = 120
        var height: CGFloat = 0
        var top: CGFloat = 0
        if staticImageView != nil {
            top = 28
            height += top + 30
        }
        if indicatorView != nil {
            top = 37
            height += top + 30
        }
        if let text = labelStatus?.text {
            let sizeMax = CGSize(width: 250, height: 250)
            let attributes: [NSAttributedString.Key: Any] = [NSAttributedString.Key.font: labelStatus?.font as Any]
            var rectLabel = text.boundingRect(with: sizeMax, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
            
            width = ceil(rectLabel.size.width) + 66
            height += ceil(rectLabel.size.height)
            height += (staticImageView == nil && indicatorView == nil) ? 40 : 20
            
            if width < 120 { width = 120 }
            
            rectLabel.origin.x = (width - rectLabel.size.width)/2
            rectLabel.origin.y = height - rectLabel.height - 20
            labelStatus?.frame = rectLabel
        }
        
        toolbarHUD?.bounds = CGRect(x: 0, y: 0, width: width, height: height)
        
        let centerX = width/2
        indicatorView?.center = CGPoint(x: centerX, y: 20 + top/2)
        staticImageView?.center = CGPoint(x: centerX, y: 20 + top/2)
    }
    
    private func setupPosition() {
        let mainWindow = UIApplication.shared.windows.first ?? UIWindow()
        let screen = mainWindow.bounds
        let center = CGPoint(x: screen.size.width/2, y: (screen.size.height)/2)
        toolbarHUD?.center = center
        viewBackground?.frame = screen
        viewBackground?.subviews
            .filter { $0.isKind(of: UIVisualEffectView.self) }
            .forEach { $0.frame = screen }
    }
    
    private func hudShow() {
        timer?.invalidate()
        timer = nil
        
        if alpha != 1 {
            alpha = 1
            if animationType == .fade {
                toolbarHUD?.alpha = 0
                UIView.animate(withDuration: 0.2, delay: 0) {
                    self.toolbarHUD?.alpha = 1.0
                }
            }
            
            if animationType == .zoom {
                let baseAnimation = CAKeyframeAnimation(keyPath: "transform.scale")
                baseAnimation.duration = 0.4
                baseAnimation.isRemovedOnCompletion = true
                baseAnimation.repeatCount = 1
                baseAnimation.keyTimes = [0.0, 0.1, 0.2, 0.3, 0.4]
                baseAnimation.values = [1.0, 1.1, 1.2, 1.1, 1.0]
                toolbarHUD?.layer.add(baseAnimation, forKey: "ProgressHUD.scale")
            }
        }
    }
    
    private func hudHide() {
        if alpha == 1 {
            if animationType == .fade {
                UIView.animate(withDuration: 0.2, delay: 0, options: [.curveEaseInOut]) {
                    self.toolbarHUD?.alpha = 0
                } completion: { _ in
                    self.hudDestroy()
                    self.alpha = 0
                }
            }
            if animationType == .zoom {
                hudDestroy()
                alpha = 0
            }
        }
    }
    
    private func hudDestroy() {
        staticImageView?.removeFromSuperview(); staticImageView = nil
        indicatorView?.removeFromSuperview(); indicatorView = nil
        labelStatus?.removeFromSuperview(); labelStatus = nil
        toolbarHUD?.removeFromSuperview(); toolbarHUD = nil
        viewBackground?.removeFromSuperview(); viewBackground = nil
        
        timer?.invalidate()
        timer = nil
    }
}

private extension ProgressHUD {
    class func hudImage(name: String) -> UIImage? {
        guard let imagePath = hudBundle()?.path(forResource: name + "@\(Int(UIScreen.main.scale))x", ofType: "png") else { return nil }
        let image = UIImage(contentsOfFile: imagePath)
        return image
    }
    
    class func hudBundle() -> Bundle? {
        if let bundlePath = Bundle.main.path(forResource: "ProgressHUD", ofType: "bundle") {
            guard let hudBundle = Bundle(path: bundlePath) else {
                return nil
            }
            return hudBundle
        }
        return nil
    }
}
