//
//  TabBarController.swift
//  Architecture
//
//  Created by Jivan on 2021/8/18.
//

import UIKit

class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupChildControllers()
    }
}

extension TabBarController {
    func setupChildControllers() {
        let informationNav = configureChilds(controller: ViewController(),
                                             title: "首页",
                                             imageName: "tabbar_information")

        let authorityNav = configureChilds(controller: ViewController(),
                                           title: "网络",
                                           imageName: "tabbar_sq")

        let mineNav = configureChilds(controller: ViewController(),
                                      title: "我的",
                                      imageName: "tabbar_mine")

        viewControllers = [informationNav, authorityNav, mineNav]
    }

    func configureChilds(controller: ViewController, title: String, imageName: String) -> NavigationController {
        controller.title = title

        let nav = NavigationController(rootViewController: controller)

        let normalImage = UIImage(named: imageName)?.withRenderingMode(.alwaysOriginal)
        let selectedImage = UIImage(named: imageName + "_sel")?.withRenderingMode(.alwaysOriginal)

        let tabBarItem = UITabBarItem(title: title,
                                      image: normalImage,
                                      selectedImage: selectedImage)
        tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.gray], for: .normal)
        tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.darkText], for: .selected)
        nav.tabBarItem = tabBarItem

        return nav
    }
}
