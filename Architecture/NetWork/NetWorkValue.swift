//
//  NetWorkValue.swift
//  NetWork
//
//  Created by Jivan on 2017/10/12.
//  Copyright © 2017年 Jivan. All rights reserved.
//

import Alamofire
import Foundation

//// MARK: - Result
public struct NetWorkValue<Value> {
    public let isCacheData: Bool
    public let result: Alamofire.AFResult<Value>
    public let response: HTTPURLResponse?

    init(isCacheData: Bool, result: Alamofire.AFResult<Value>, response: HTTPURLResponse?) {
        self.isCacheData = isCacheData
        self.result = result
        self.response = response
    }
}
