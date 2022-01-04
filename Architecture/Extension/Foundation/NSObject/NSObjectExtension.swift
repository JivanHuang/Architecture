//
//  Created by Jivan on 24/04/21.
//  Copyright Jivan. All rights reserved.
//

import Foundation

public typealias NotificationClosures = (Notification) -> Void
private var notificationActionKey: Void?

public enum NotificationNameType: String {
    // Add Your New Notify Example: case NotifyName ..

    case example
}

public extension NSObject {
    private var notificationClosuresDict: [NSNotification.Name: NotificationClosures]? {
        get {
            return objc_getAssociatedObject(self, &notificationActionKey)
                as? [NSNotification.Name: NotificationClosures]
        }
        set {
            objc_setAssociatedObject(self, &notificationActionKey, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
    }

    func postNotification(_ name: NotificationNameType, userInfo: [AnyHashable: Any]?) {
        NotificationCenter.default.post(name: NSNotification.Name(name.rawValue), object: self, userInfo: userInfo)
    }

    func observerNotification(_ name: NotificationNameType, action: @escaping NotificationClosures) {
        if var dict = notificationClosuresDict {
            guard dict[NSNotification.Name(name.rawValue)] == nil else {
                return
            }
            dict.updateValue(action, forKey: NSNotification.Name(name.rawValue))
            notificationClosuresDict = dict
        } else {
            notificationClosuresDict = [NSNotification.Name(name.rawValue): action]
        }
        NotificationCenter.default.addObserver(self, selector: #selector(notificationAction),
                                               name: NSNotification.Name(name.rawValue), object: nil)
    }

    func removeNotification(_ name: NotificationNameType) {
        NotificationCenter.default.removeObserver(self)
        notificationClosuresDict?.removeValue(forKey: NSNotification.Name(name.rawValue))
    }

    @objc internal func notificationAction(notify: Notification) {
        if let notificationClosures = notificationClosuresDict, let closures = notificationClosures[notify.name] {
            closures(notify)
        }
    }
}

public extension NSObject {
    /// The name of a the type inheriting of `NSObject`
    /// - Returns: String
    var className: String {
        Self.className
    }

    /// The name of a the type inheriting of `NSObject`
    /// - Returns: String
    static var className: String {
        String(describing: self)
    }
}
