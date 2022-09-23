//
//  UIControl+Closure.swift
//  Architecture
//
//  Created by Jivan on 2022/5/25.
//

#if canImport(UIKit)
import UIKit

public extension UIControl {
    @discardableResult
    func listen(_ action: @escaping () -> (), for controlEvents: UIControl.Event) -> AnyObject {
        let sleeve = ClosureSleeve(attachTo: self, closure: action, controlEvents: controlEvents)
        addTarget(sleeve, action: #selector(ClosureSleeve.invoke), for: controlEvents)
        return sleeve
    }
    
    func listenOnce(_ action: @escaping () -> (), for controlEvents: UIControl.Event) {
        let sleeve = ClosureSleeve(attachTo: self, closure: action, controlEvents: controlEvents)
        addTarget(sleeve, action: #selector(ClosureSleeve.invokeOnce), for: controlEvents)
    }
    
    func unlisten(sleeve: AnyObject) {
        guard let sleeve = sleeve as? ClosureSleeve else { return }
        removeTarget(sleeve, action: #selector(ClosureSleeve.invoke), for: sleeve.controlEvents)
    }
}

private class ClosureSleeve {
    let closure: () -> ()
    let controlEvents: UIControl.Event
    let attachedTo: UIControl
    
    init(attachTo: UIControl, closure: @escaping () -> (), controlEvents: UIControl.Event) {
        self.attachedTo = attachTo
        self.closure = closure
        self.controlEvents = controlEvents
        objc_setAssociatedObject(attachTo, "[\(arc4random())]", self, .OBJC_ASSOCIATION_RETAIN)
    }
    
    @objc func invoke() {
        closure()
    }
    
    @objc func invokeOnce() {
        closure()
        attachedTo.unlisten(sleeve: self)
    }
}
#endif
