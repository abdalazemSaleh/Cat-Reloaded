//
//  Login+Protocol.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2022-10-05.
//

import UIKit

extension LoginVC: LoginView {
    
    func goToHomeScreen() { presentGFTabBar() }
        
    func alertMessage(message: String) {
        let customAlert = GFAlertView(message: message)
        view.addSubview(customAlert)
    }
    
    func goToRegisterVC() {
        let vc  = RegisterVC()
        nav(vc: vc)
    }
}
