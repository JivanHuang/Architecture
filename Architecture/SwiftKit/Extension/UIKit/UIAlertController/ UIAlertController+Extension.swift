//
//   UIAlertController+Extension.swift
//  Architecture
//
//  Created by Jivan on 2022/5/23.
//

import UIKit

public extension UIAlertController {
    @discardableResult
    convenience init(title: String?, message: String?) {
        self.init(title: title, message: message, preferredStyle: .alert)
    }

    @discardableResult
    func addAction(_ alertActionTitle: String?, _ alertActionStyle: UIAlertAction.Style = .default, handler: (@escaping () -> Void) = {}) -> Self {
        let action = UIAlertAction(title: alertActionTitle, style: alertActionStyle) { _ in
            handler()
        }
        addAction(action)
        return self
    }

    @discardableResult
    func addAction(action: UIAlertAction) -> Self {
        addAction(action)
        return self
    }

    func show() {
        UIApplication.shared.window?.rootViewController?.present(self, animated: true, completion: nil)
    }

    func show(_ controller: UIViewController? = UIApplication.shared.topViewController(), dismiss deadline: TimeInterval? = nil) {
        guard let controller = controller else {
            return
        }
        controller.present(self, animated: true, completion: nil)
        guard let deadline = deadline else {
            return
        }
        DispatchQueue.global().asyncAfter(deadline: DispatchTime.now() + deadline) {
            DispatchQueue.main.async { [weak self] in
                guard let weakSelf = self else { return }
                weakSelf.dismiss(animated: true)
            }
        }
    }
}
