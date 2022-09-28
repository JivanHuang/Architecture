//
//  UISearchBarExtensions.swift
//  Architecture
//
//  Created by Jivan on 2022/9/28.
//

#if canImport(UIKit) && os(iOS)
import UIKit

// MARK: - Properties

public extension UISearchBar {
    
    var textField: UITextField? {
        if #available(iOS 13.0, *) {
            return searchTextField
        }
        let subViews = subviews.flatMap(\.subviews)
        guard let textField = (subViews.filter { $0 is UITextField }).first as? UITextField else {
            return nil
        }
        return textField
    }

    var trimmedText: String? {
        return text?.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}

// MARK: - Methods

public extension UISearchBar {
  
    func clear() {
        text = ""
    }
}

#endif
