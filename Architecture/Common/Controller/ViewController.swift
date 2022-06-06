//
//  ViewController.swift
//  Architecture
//
//  Created by Jivan on 2021/8/18.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Theme.backgroundColor
        ProgressHUD.animationType = .zoom
        ProgressHUD.colorHUD = .black
        ProgressHUD.colorTint = .white
        ProgressHUD.showWarn("啊啊啊啊", interaction: true)
    }
}
