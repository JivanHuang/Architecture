//
//  AppDelegate.swift
//  Architecture
//
//  Created by Jivan on 2021/8/18.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        makeKeyWindow()
        return true
    }
}

extension AppDelegate {
    func makeKeyWindow() {
        let rootViewController = TabBarController()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = UIColor.white
        window?.rootViewController = rootViewController
        window?.makeKeyAndVisible()
    }
}
