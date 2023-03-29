//
//  ProfileVC+Protocol.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2023-03-28.
//

import Foundation

extension ProfileVC: ProfileView {
    func showAlerMessage(message: String) {
        presentGFAlert(title: "Hello", message: message, buttonTitle: "OK")
    }
}
