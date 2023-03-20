//
//  SettingsVC.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2023-02-11.
//

import UIKit

class SettingsVC: UIViewController {
    
    // MARK: - Variables
    var tableView: UITableView!
    
    let themes = ["Dark mode", "Light mode", "System"]
    let currentTheme = UserDefaults.standard.string(forKey: "theme")
    
    var settings: [SettingsModel] = []
    
    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Settings"
        settings.append(.init(image: SFSymbols.apperance, label: "Apperance", addetionalDetails: currentTheme ?? ""))
        settings.append(.init(image: SFSymbols.language, label: "Language", addetionalDetails: "English"))
        configureTableView()
        registerTableViewCells()
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
    // MARK: - Functions
    func configureUserInterFace(theme: Theme) {

        let scenes = UIApplication.shared.connectedScenes
        let windowScene = scenes.first as? UIWindowScene
        let window = windowScene?.windows.first
        
        switch theme {
        case .light:
            window?.overrideUserInterfaceStyle = .light
        case .dark:
            window?.overrideUserInterfaceStyle = .dark
        case .system:
            window?.overrideUserInterfaceStyle = .unspecified
        }
    }
}
