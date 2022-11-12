//
//  RegisterPresenter.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2022-10-07.
//

import Foundation

protocol RegisterView: AnyObject {
    func startAnimation()
    func stopAnimation()
    func goToHomeScreen()
    func checkValidation()
    func alertMessage(message: String)
    func goToLoginVC()
}

class RegisterPresenter {
    // about init & delegation
    private weak var view: RegisterView?
    init(view: RegisterView) {
        self.view = view
    }
    // Code
    func signUp(parms: [String : Any]) {
        view?.startAnimation()
        NetworkManger.shared.request(modal: SignUpModel.self, url: URLs.sginup.rawValue, method: .post, parms: parms, header: nil) { result in
            switch result {
            case .success(let data):
                print(data)
//                if data.errorCode == 1000 {
//                    self.view?.alertMessage(message: GFErro.invalidData.rawValue)
//                } else {
//                    self.view?.goToHomeScreen()
//                }
                self.view?.stopAnimation()
            case .failure(let error):
                print(error?.localizedDescription ?? "Error while login please try agine")
                self.view?.stopAnimation()
            }
        }
    }
    
    func login() {
        view?.goToLoginVC()
    }
}
