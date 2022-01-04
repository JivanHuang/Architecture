//
//  NetWorkLog.swift
//  NetWork
//
//  Created by Jivan on 2017/10/12.
//  Copyright © 2017年 Jivan. All rights reserved.
//

import Foundation

// MARK: - log日志

func NetWorkLog<T>(_ message: T, file: String = #file, method: String = #function, line: Int = #line) {
    #if DEBUG
        print("\((file as NSString).lastPathComponent)[\(line)], \(method): \(message)")
    #endif
}
