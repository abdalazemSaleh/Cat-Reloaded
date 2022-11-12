//
//  GFNavigationController.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2022-10-03.
//

import UIKit

class GFNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigationController()
    }
    
    func setUpNavigationController() {
        navigationItem.backBarButtonItem?.tintColor = UIColor.green
        let mainView = BoardingVC()
        self.viewControllers = [mainView]
    }
}
