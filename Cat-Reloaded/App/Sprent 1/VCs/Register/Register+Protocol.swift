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
            
            guard validEmail else { return presentGFAlert(title: "Woops", message: "Check you email", buttonTitle: "OK") }
            guard validPhoneNumber else { return presentGFAlert(title: "Woops", message: "Check your phone number. 🙁", buttonTitle: "OK") }
            guard validPassword else { return password.layer.borderColor = UIColor.systemRed.cgColor }
        }
    }
    
    func goToHomeScreen() { presentGFTabBar() }
    
    func startAnimation() { signUpButton.startAnimation()}
    
    func stopAnimation() { signUpButton.handelButtonAfterStopAnimation()}
    
    func alertMessage(message: String) { presentGFAlert(title: "Woops", message: message, buttonTitle: "OK") }

    func goToLoginVC() { dismis() }
}
