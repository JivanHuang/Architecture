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

        // Do any additional setup after loading the view.
        setupChildControllers()
    }
}

private extension TabBarController {
    func setupChildControllers() {
        let home = configNavigationController(viewController: ViewController(), title: "Home", image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))

        let location = configNavigationController(viewController: ViewController(), title: "Location", image: UIImage(systemName: "location"), selectedImage: UIImage(systemName: "location.fill"))

        let person = configNavigationController(viewController: ViewController(), title: "Person", image: UIImage(systemName: "person"), selectedImage: UIImage(systemName: "person.fill"))
        viewControllers = [home, location, person]
    }

    func configNavigationController(viewController: ViewController, title: String?, image: UIImage?, selectedImage: UIImage?) -> NavigationController
    {
        let navigationController = NavigationController(rootViewController: viewController)
        let tabBarItem = UITabBarItem(title: title, image: image, selectedImage: selectedImage)
        navigationController.tabBarItem = tabBarItem
        return navigationController
    }
}
