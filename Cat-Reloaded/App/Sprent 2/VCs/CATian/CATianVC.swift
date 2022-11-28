//
//  CATianVC.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2022-10-11.
//

import UIKit

class CATianVC: UIViewController {

    let logoutButton = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(button)
        button.backgroundColor = .red
        button.setTitle("Logout", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.heightAnchor.constraint(equalToConstant: 48),
            button.widthAnchor.constraint(equalToConstant: 280)
        ])
        button.addTarget(self, action: #selector(logoutButtonAction), for: .touchUpInside)
    }
    
    @objc func logoutButtonAction() {
        UserData.resetDefaults()
        presentLoginScreen()
    }
}
