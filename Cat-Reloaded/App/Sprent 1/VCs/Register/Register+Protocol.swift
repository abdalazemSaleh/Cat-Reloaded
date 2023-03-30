//
//  Register+Protocol.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2022-10-07.
//

import UIKit

extension RegisterVC: RegisterView {
    
    func checkValidation() {
        // Check validation
        func checkTextFiledsValidation() {
            let validEmail           = email.isValidEmail()
            let validPhoneNumber     = phoneNumber.isValidPhoneNumber()
            let validPassword        = password.isValidPassword()
            
            guard validEmail else {
                let customAlert = GFAlertView(message: "Check your mail")
                view.addSubview(customAlert)
                return
            }
            guard validPhoneNumber else {
                let customAlert = GFAlertView(message: "Check your phone number.")
                view.addSubview(customAlert)
                return
            }
            guard validPassword else { return password.layer.borderColor = UIColor.systemRed.cgColor }
        }
    }
    
    func goToHomeScreen() { presentGFTabBar() }
        
    func alertMessage(message: String) {
        let customAlert = GFAlertView(message: message)
        view.addSubview(customAlert)
        return
    }

    func goToLoginVC() { dismis() }
}
