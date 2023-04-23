//
//  SettingsVC.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2023-02-11.
//

import UIKit

class SettingsVC: UIViewController, SettingsView {
    
    // MARK: - Variables
    var tableView: UITableView!
    
    var presenter: SettingsPresenter!
    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Settings"
        presenter = SettingsPresenter(view: self)
        configureTableView()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureNavigationController()
    }
    // MARK: - Functions
    private func configureNavigationController() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles  = true
        
        navigationController?.navigationBar.tintColor = Colors.mainColor
    }
}
