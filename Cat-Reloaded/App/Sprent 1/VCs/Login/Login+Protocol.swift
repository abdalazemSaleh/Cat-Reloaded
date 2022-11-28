//
//  Login+Protocol.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2022-10-05.
//

import UIKit

extension LoginVC: LoginView {
    
    func goToHomeScreen() { presentGFTabBar() }
    
    func startAnimation() { loginbutton.startAnimation() }
    
    func stopAnimation() {
        DispatchQueue.main.async {
            self.loginbutton.handelButtonAfterStopAnimation()
        }
    }
    
    func alertMessage(message: String) {
        print(message)
//        presentAlertMessage(message: message)
    }
    
    func goToRegisterVC() {
        let vc  = RegisterVC()
        nav(vc: vc)
    }
}
