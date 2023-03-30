//
//  RegisterPresenter.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2022-10-07.
//

import Foundation

protocol RegisterView: AnyObject {
    func handelButtonStyle()
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
        view?.handelButtonStyle()
        let signUpObject = NetworkManger(url: URLs.sginup.rawValue, method: .post, parms: parms, header: nil)
        signUpObject.request(modal: ProfileModel.self) { [weak self] result in
            guard let self = self else { return }
            self.view?.handelButtonStyle()
            switch result {
            case .success(let user):
                UserDefaults.standard.set(user.token ?? "", forKey: "UserToken")
                UserData.fetchUserInfo { response in
                    switch response {
                    case .success(_):
                        print("Successed")
                        self.view?.goToHomeScreen()
                    case .failure(let error):
                        print(error.rawValue)
                    }
                }
            case .failure(let error):
                self.view?.alertMessage(message: error.rawValue)
            }
        }
    }
    
    func login() {
        view?.goToLoginVC()
    }
}
