//
//  TabBarController.swift
//  Architecture
//
//  Created by Jivan on 2021/8/18.
//

import UIKit

private typealias Tuple = (viewController: ViewController, title: String?, image: UIImage?, selectedImage: UIImage?)

class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupChildControllers()
    }
}

private extension TabBarController {
    func setupChildControllers() {
        let home: Tuple = (ViewController(), "Home", UIImage(systemName: "house"), UIImage(systemName: "house.fill"))

        let square = (ViewController(), "Square", UIImage(systemName: "heart.text.square"), UIImage(systemName: "heart.text.square.fill"))

        let person = (ViewController(), "Person", UIImage(systemName: "person"), UIImage(systemName: "person.fill"))

        let controllers = [home, square, person]

        controllers.forEach { viewController, title, image, selectedImage in

            let nav = configNavigationController(viewController: viewController, title: title, image: image, selectedImage: selectedImage)
            addChild(nav)
        }
    }

    func configNavigationController(viewController: ViewController, title: String?, image: UIImage?, selectedImage: UIImage?) -> NavigationController
    {
        let navigationController = NavigationController(rootViewController: viewController)
        let tabBarItem = UITabBarItem(title: title, image: image, selectedImage: selectedImage)
        navigationController.tabBarItem = tabBarItem
        return navigationController
    }
}
