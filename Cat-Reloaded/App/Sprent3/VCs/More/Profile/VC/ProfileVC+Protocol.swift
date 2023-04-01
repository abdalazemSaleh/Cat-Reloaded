//
//  ProfileVC+Protocol.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2023-03-28.
//

import Foundation

extension ProfileVC: ProfileView {
    func showAlerMessage(message: String) {
            let customAlert = GFAlertView(message: message)
            view.addSubview(customAlert)
            return
    }
}
