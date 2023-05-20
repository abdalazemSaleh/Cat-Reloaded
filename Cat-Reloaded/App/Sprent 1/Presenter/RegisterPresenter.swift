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
    private var service: RegisterServiceable!
    init(view: RegisterView) {
        self.view = view
        self.service = RegisterServices()
    }
    
    @MainActor
    func signUp(parms: [String : Any]) async {
        view?.handelButtonStyle()
        do {
            let user = try await service.register(parms: parms)
            UserDefaults.standard.set(user.token ?? "", forKey: "UserToken")
            UserData.chacheUserModel(user: user)
            view?.goToHomeScreen()
            view?.handelButtonStyle()            
        } catch {
            view?.handelButtonStyle()
            view?.alertMessage(message: error.localizedDescription)
        }
    }
    
    func login() {
        view?.goToLoginVC()
    }
}
