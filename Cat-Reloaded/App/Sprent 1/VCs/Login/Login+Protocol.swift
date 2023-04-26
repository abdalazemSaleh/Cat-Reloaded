//
//  Login+Protocol.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2022-10-05.
//

import UIKit

extension LoginVC: LoginView {
    func isTextFieldsIsEmpty() -> loginParms {
        guard let phoneNumber = phone.text, !phoneNumber.isEmpty else {
            phoneError.isHidden = false
            return loginParms.init(phone: "", password: "")
        }
        guard let password = password.text, !password.isEmpty else {
            phoneError.isHidden = true
            passwordError.isHidden = false
            return loginParms.init(phone: "", password: "")
        }
        return loginParms.init(phone: phoneNumber, password: password)
    }
    
    
    func showPasswordError(_ show: Bool) { passwordError.isHidden = show}
    
    func showPhoneNumberError(_ show: Bool) { phoneError.isHidden = show }
    

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
