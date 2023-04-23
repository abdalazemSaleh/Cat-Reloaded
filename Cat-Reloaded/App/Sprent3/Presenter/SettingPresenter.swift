//
//  SettingPresenter.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2023-04-23.
//

import UIKit

protocol SettingsView: AnyObject {
}


class SettingsPresenter {
    // about init & delegation
    private weak var view: SettingsView?
    init(view: SettingsView) {
        self.view = view
    }
    // Variables
    var hiddenSections = Set<Int>()
    private(set) var settingsData = [
        ["Dark mode", "Light mode", "System"],
        ["English", "Arabic"]
    ]
    private(set) var settings: [SettingsModel] = [
        SettingsModel(image: SFSymbols.apperance, label: "Apperance", addetionalDetails: "System"),
        .init(image: SFSymbols.language, label: "Language", addetionalDetails: "English")
    ]
    
    // Functions
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
