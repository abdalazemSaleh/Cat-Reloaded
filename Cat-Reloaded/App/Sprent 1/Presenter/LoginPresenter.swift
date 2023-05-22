//
//  LoginPresenter.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2022-10-05.
//


import Foundation
import FBSDKLoginKit
import GoogleSignIn

protocol LoginView: AnyObject {
    func isTextFieldsIsEmpty() -> loginParms
    func handelButtonStyle()
    func goToHomeScreen()
    func alertMessage(message: String)
    func goToRegisterVC()
    func showPasswordError(_ show: Bool)
    func showPhoneNumberError(_ show: Bool)
}

class LoginPresenter {
    // about init & delegation
    private weak var view: LoginView?
    private var service: LoginServiceable!
    init(view: LoginView, service: LoginServiceable) {
        self.view = view
        self.service = service
    }
    // MARK: - Code
    @MainActor
    private func loginWithPhoneNumber(parms: [String: Any]) async {
        self.view?.handelButtonStyle()
        do {
            let user = try await service.login(parms: parms)
            UserDefaults.standard.set(user.token ?? "", forKey: "UserToken")
            UserData.chacheUserModel(user: user)
            view?.goToHomeScreen()
            view?.handelButtonStyle()
        } catch {
            view?.handelButtonStyle()
            self.view?.alertMessage(message: error.localizedDescription)
        }
    }

    @MainActor
    private func loginWithFacebook(controller: UIViewController) {
        let loginManger = LoginManager()
        loginManger.logIn(permissions: ["public_profile", "email"], from: controller) { [weak self] result, error in
            guard let self = self else { return }
            guard error == nil, let token = result?.token?.tokenString else { return }
            let parms = [
                "provider" : "facebook",
                "token" : token
            ]
            Task {
                do {
                    try await self.loginByToken(parms: parms)
                } catch {
                    self.view?.alertMessage(message: error.localizedDescription)
                }
            }
        }
    }

    @MainActor
    func loginWithGoogle(controller: UIViewController) async {
        do {
            let user = try await GIDSignIn.sharedInstance.signIn(withPresenting: controller)
            let idToken = user.user.idToken
            let parms = [
                "provider" : "google",
                "token" : idToken?.tokenString ?? ""
            ]
            try await loginByToken(parms: parms)
            view?.goToHomeScreen()
        } catch {
            view?.alertMessage(message: error.localizedDescription)
        }
    }
    
    private func loginByToken(parms: [String: Any]) async throws {
        do {
            let user = try await service.loginWithSocileMedia(parms: parms)
            UserDefaults.standard.set(user.token ?? "", forKey: "UserToken")
            UserData.chacheUserModel(user: user)
        } catch {
            throw error
        }
    }
    
    @objc func loginButtonClicked() {
        guard let model = view?.isTextFieldsIsEmpty() else { return }
        guard !model.phone.isEmpty, !model.password.isEmpty else { return }
        view?.showPasswordError(true)
        let parms = [
            "phoneNumber" : model.phone,
            "password" : model.password
        ]
        Task {
            await loginWithPhoneNumber(parms: parms)
        }
    }
    
    @objc func signUpButtonClicked() {
        signUp()
    }
        
    @MainActor
    @objc func facebookButtonClicked(controller: UIViewController) {
        loginWithFacebook(controller: controller)
    }
    
    @objc func forgetPasswordClicked() { }
    
    private func signUp() {
        view?.goToRegisterVC()
    }
}
