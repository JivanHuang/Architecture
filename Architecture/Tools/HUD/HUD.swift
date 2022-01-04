//
//  HUD.swift
//  Architecture
//
//  Created by Jivan on 2021/8/30.
//


import UIKit
import MBProgressHUD

class HUD {
    enum HUDType: String {
        case success
        case error
        case warn
        case loading = ""
    }
}

extension HUD {
    public class func show(type: HUDType, text: String, view: UIView = HUD.window(), delay: TimeInterval = 1.0) {
        let hud = MBProgressHUD.showAdded(to: view, animated: true)
        hud.label.text = text
        if type == .loading {
            hud.mode = .indeterminate
        } else {
            hud.mode = .customView
            let image = HUD.hudImage(name: type.rawValue)?.withRenderingMode(.alwaysTemplate)
            let imageView = UIImageView(image: image)
            imageView.tintColor = .white
            hud.customView = imageView
            hud.hide(animated: true, afterDelay: delay)
        }
        hud.contentColor = .white
        hud.bezelView.blurEffectStyle = .dark
        hud.bezelView.color = .black
        hud.removeFromSuperViewOnHide = true
    }
}

private extension HUD {
    class func window() -> UIWindow {
        if let window = UIApplication.shared.keyWindow {
            return window
        }
        if let firstWindow = UIApplication.shared.windows.first {
            return firstWindow
        }
        if let norWindow = UIApplication.shared.delegate?.window {
            return norWindow ?? UIWindow()
        }
        
        return UIWindow()
    }
    
    class func hudImage(name: String) -> UIImage? {
        guard let imagePath = HUD.hudBundle()?.path(forResource: name, ofType: "png") else { return nil }
        let image = UIImage(contentsOfFile: imagePath)
        return image
    }
    
    class func hudBundle() -> Bundle? {
        if let bundlePath = Bundle.main.path(forResource: "HUD", ofType: "bundle") {
            guard let hudBundle = Bundle(path: bundlePath) else {
                return nil
            }
            return hudBundle
        }
        return nil
    }
}
