//
//  NetWork.swift
//  ZoneHot
//
//  Created by Jivan on 2017/10/10.
//  Copyright © 2017年 Jivan. All rights reserved.
//

import Alamofire
import Cache
import UIKit

public enum NetWork {
    /// 开启/关闭请求url log
    public static var openUrlLog: Bool = false
    /// 开启/关闭结果log
    public static var openResultLog: Bool = false

    /// 缓存过期时间
    ///
    /// - Parameter expiry: 参考 NetExpiry
    public static func cacheExpiryConfig(expiry: NetExpiry) {
        CacheManager.default.expiryConfiguration(expiry: expiry)
    }

    /// 超时时间
    ///
    /// - Parameter timeInterval: 超时时间
    public static func timeoutIntervalForRequest(_ timeInterval: TimeInterval) {
        RequestManager.default.timeoutIntervalForRequest(timeInterval)
    }
}

// MARK: 网络请求

public extension NetWork {
    /// 网络请求
    ///
    /// - Parameters:
    ///   - url: url
    ///   - method: .get .post ...
    ///   - params: 参数字典
    ///   - dynamicParams: 变化的参数，例如 时间戳-token 等
    ///   - encoding: 编码方式
    ///   - headers: 请求头
    /// - Returns:
    @discardableResult
    static func request(
        _ url: String,
        method: HTTPMethod = .get,
        params: Parameters? = nil,
        dynamicParams: Parameters? = nil,
        encoding: ParameterEncoding = URLEncoding.default,
        headers: HTTPHeaders? = nil)
        -> RequestTaskManager
    {
        return RequestManager.default.request(url, method: method, params: params, dynamicParams: dynamicParams, encoding: encoding, headers: headers)
    }

    /// urlRequest请求
    ///
    /// - Parameters:
    ///   - urlRequest: 自定义URLRequest
    ///   - params: URLRequest中需要的参数，作为key区分缓存
    ///   - dynamicParams: 变化的参数，例如 时间戳, `token` 等, 用来过滤`params`中的动态参数
    /// - Returns: RequestTaskManager?
    @discardableResult
    static func request(
        urlRequest: URLRequestConvertible,
        params: Parameters,
        dynamicParams: Parameters? = nil)
        -> RequestTaskManager?
    {
        return RequestManager.default.request(urlRequest: urlRequest, params: params, dynamicParams: dynamicParams)
    }

    /// 取消请求
    ///
    /// - Parameters:
    ///   - url: url
    ///   - params: 参数
    ///   - dynamicParams: 变化的参数，例如 时间戳-token 等
    static func cancel(_ url: String, params: Parameters? = nil, dynamicParams: Parameters? = nil) {
        RequestManager.default.cancel(url, params: params, dynamicParams: dynamicParams)
    }

    /// 清除所有缓存
    ///
    /// - Parameter completion: 完成回调
    static func removeAllCache(completion: @escaping (Bool) -> Void) {
        RequestManager.default.removeAllCache(completion: completion)
    }

    /// 根据url和params清除缓存
    ///
    /// - Parameters:
    ///   - url: url
    ///   - params: 参数
    ///   - dynamicParams: 变化的参数，例如 时间戳-token 等
    ///   - completion: 完成回调
    static func removeObjectCache(_ url: String, params: [String: Any]? = nil, dynamicParams: Parameters? = nil, completion: @escaping (Bool) -> Void) {
        RequestManager.default.removeObjectCache(url, params: params, dynamicParams: dynamicParams, completion: completion)
    }
}

// MARK: - 下载

public extension NetWork {
    /// 文件下载
    ///
    /// - Parameters:
    ///   - url: url
    ///   - method: .get .post ... 默认.get
    ///   - parameters: 参数
    ///   - dynamicParams: 变化的参数，例如 时间戳-token 等
    ///   - encoding: 编码方式
    ///   - headers: 请求头
    ///   - fileName: 自定义文件名，需要带文件扩展名
    /// - Returns: DownloadTaskManager
    static func download(
        _ url: String,
        method: HTTPMethod = .get,
        parameters: Parameters? = nil,
        dynamicParams: Parameters? = nil,
        encoding: ParameterEncoding = URLEncoding.default,
        headers: HTTPHeaders? = nil,
        fileName: String? = nil)
        -> DownloadTaskManager
    {
        return DownloadManager.default.download(url, method: method, parameters: parameters, dynamicParams: dynamicParams, encoding: encoding, headers: headers, fileName: fileName)
    }

    /// 取消下载
    ///
    /// - Parameter url: url
    static func downloadCancel(_ url: String, parameters: Parameters? = nil, dynamicParams: Parameters? = nil) {
        DownloadManager.default.cancel(url, parameters: parameters, dynamicParams: dynamicParams)
    }

    /// Cancel all download tasks
    static func downloadCancelAll() {
        DownloadManager.default.cancelAll()
    }

    /// 下载百分比
    ///
    /// - Parameter url: url
    /// - Returns: percent
    static func downloadPercent(_ url: String, parameters: Parameters? = nil, dynamicParams: Parameters? = nil) -> Double {
        return DownloadManager.default.downloadPercent(url, parameters: parameters, dynamicParams: dynamicParams)
    }

    /// 删除某个下载
    ///
    /// - Parameters:
    ///   - url: url
    ///   - completion: download success/failure
    static func downloadDelete(_ url: String, parameters: Parameters? = nil, dynamicParams: Parameters? = nil, completion: @escaping (Bool) -> Void) {
        DownloadManager.default.delete(url, parameters: parameters, dynamicParams: dynamicParams, completion: completion)
    }

    /// 下载状态
    ///
    /// - Parameter url: url
    /// - Returns: status
    static func downloadStatus(_ url: String, parameters: Parameters? = nil, dynamicParams: Parameters? = nil) -> DownloadStatus {
        return DownloadManager.default.downloadStatus(url, parameters: parameters, dynamicParams: dynamicParams)
    }

    /// 下载完成后，文件所在位置
    ///
    /// - Parameter url: url
    /// - Returns: file URL
    static func downloadFilePath(_ url: String, parameters: Parameters? = nil, dynamicParams: Parameters? = nil) -> URL? {
        return DownloadManager.default.downloadFilePath(url, parameters: parameters, dynamicParams: dynamicParams)
    }

    /// 下载中的进度,任务下载中时，退出当前页面,再次进入时继续下载
    ///
    /// - Parameters:
    ///   - url: url
    ///   - progress: 进度
    /// - Returns: taskManager
    @discardableResult
    static func downloadProgress(_ url: String, parameters: Parameters? = nil, dynamicParams: Parameters? = nil, progress: @escaping ((Double) -> Void)) -> DownloadTaskManager? {
        return DownloadManager.default.downloadProgress(url, parameters: parameters, dynamicParams: dynamicParams, progress: progress)
    }
}
