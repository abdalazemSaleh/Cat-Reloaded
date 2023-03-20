//
//  DarkTheme.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2023-02-11.
//

import UIKit

enum Theme: String {
    case light, dark, system

    var uiInterfaceStyle: UIUserInterfaceStyle {
        switch self {
        case .light:
            return .light
        case .dark:
            return .dark
        case .system:
            return .unspecified
        }
    }
}

