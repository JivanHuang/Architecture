//
//  UISwitch+Toggle.swift
//  Architecture
//
//  Created by Jivan on 2022/5/23.
//

#if os(iOS)

import UIKit

public extension UISwitch {
    func toggle() {
        self.setOn(!self.isOn, animated: true)
    }
}

#endif
