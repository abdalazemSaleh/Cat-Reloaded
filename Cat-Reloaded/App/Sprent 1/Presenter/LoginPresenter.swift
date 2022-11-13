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
    func startAnimation()
    func stopAnimation()
    func goToHomeScreen()
    func alertMessage(message: String)
    func goToRegisterVC()
}

class LoginPresenter {
    // about init & delegation
    private weak var view: LoginView?
    init(view: LoginView) {
        self.view = view
    }
    // MARK: - Code
    // Login
    func login(parms: [String: Any]) {
        view?.startAnimation()
        NetworkManger.shared.request(modal: LoginModel.self, url: URLs.login.rawValue, method: .post, parms: parms, header: nil) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let date):
                print(date)
                if date.errorCode == 1000 {
                    self.view?.alertMessage(message: GFErro.invalidData.rawValue)
                } else {
                    self.view?.goToHomeScreen()
                }
                self.view?.stopAnimation()
            case .failure(let error):
                print(error)
                self.view?.stopAnimation()
            }
        }
    }
    // Login with facebook
    func loginWithFacebook(controller: UIViewController) {
        let loginManger = LoginManager()
        loginManger.logIn(permissions: ["public_profile", "email"], from: controller) { result, error in
            guard error == nil, let token = result?.token?.tokenString else { return }
            print(token)
        }
    }
    // Login with google
    func loginWithGoogle(controller: UIViewController) {
        let signInConfig = GIDConfiguration(clientID: "783608969759-0brae1mhmc6nnrl682teqi6lr8onhm49.apps.googleusercontent.com")
        GIDSignIn.sharedInstance.signIn(with: signInConfig, presenting: controller) { user, error in
            guard error == nil else { return }
            guard let user = user else { return }
            user.authentication.do { authentication, error in
                let idToken = authentication?.idToken
                // Send ID token to backend
            }
        }
    }
    // SginUp
    func signUp() {
        view?.goToRegisterVC()
    }
}
