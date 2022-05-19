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

        // Do any additional setup after loading the view.
        setupChildControllers()
    }
}

private extension TabBarController {
    func setupChildControllers() {
        let home: Tuple = (ViewController(), "Home", UIImage(systemName: "house"), UIImage(systemName: "house.fill"))

        let location = (ViewController(), "Location", UIImage(systemName: "location"), UIImage(systemName: "location.fill"))

        let person = (ViewController(), "Person", UIImage(systemName: "person"), UIImage(systemName: "person.fill"))

        let controllers = [home, location, person]

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
