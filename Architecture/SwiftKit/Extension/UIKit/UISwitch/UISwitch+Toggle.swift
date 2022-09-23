//
//  UISwitch+Toggle.swift
//  Architecture
//
//  Created by Jivan on 2022/5/23.
//

#if canImport(UIKit)
import UIKit

#if os(iOS)

public extension UISwitch {
    func toggle() {
        self.setOn(!self.isOn, animated: true)
    }
}

#endif

#endif
