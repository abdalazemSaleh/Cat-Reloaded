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
        let signUpObject = NetworkManger(url: URLs.sginup.rawValue, method: .post, parms: parms, header: nil)
        signUpObject.request(modal: ProfileModel.self) { result in
            self.view?.stopAnimation()
            switch result {
            case .success(let user):
                print(user)
                UserData.chacheUserModel(user: user)
                self.view?.goToHomeScreen()
            case .failure(let error):
                print(error.rawValue)
            }
        }
    }
    
    func login() {
        view?.goToLoginVC()
    }
}
