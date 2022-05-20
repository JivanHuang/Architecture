//
//  NamespaceWrapper.swift
//  QiBox
//
//  Created by Jivan on 2021/11/16.
//
// 协议实现命名空间

import Foundation
import UIKit

/// 类型协议
protocol TypeWrapperProtocol {
    associatedtype WrappedType
    var wrappedValue: WrappedType { get }
    init(value: WrappedType)
}

struct NamespaceWrapper<T>: TypeWrapperProtocol {
    let wrappedValue: T
    init(value: T) {
        self.wrappedValue = value
    }
}

/// 命名空间协议
protocol NamespaceWrappable {
    associatedtype WrapperType
    var sp: WrapperType { get }
    static var sp: WrapperType.Type { get }
}

extension NamespaceWrappable {
    var sp: NamespaceWrapper<Self> {
        return NamespaceWrapper(value: self)
    }

    static var sp: NamespaceWrapper<Self>.Type {
        return NamespaceWrapper.self
    }
}

extension UIColor: NamespaceWrappable {}
extension UIFont: NamespaceWrappable {}

// 使用示例
// extension UIColor: NamespaceWrappable {}
//
// extension TypeWrapperProtocol where WrappedType: UIColor {
//    static func red() -> UIColor {
//        return UIColor.red
//    }
// }
