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
    func handelButtonStyle()
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
        self.view?.handelButtonStyle()
        let loginObject = NetworkManger(url: URLs.login.rawValue, method: .post, parms: parms, header: nil)
        loginObject.request(modal: ProfileModel.self) { [weak self] result in
            guard let self = self else { return }
            self.view?.handelButtonStyle()
            switch result {
            case .success(let user):
                UserDefaults.standard.set(user.token ?? "", forKey: "UserToken")
                UserData.fetchUserInfo { response in
                    switch response {
                    case .success(_):
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
    // Login with facebook
    func loginWithFacebook(controller: UIViewController) {
        let loginManger = LoginManager()
        loginManger.logIn(permissions: ["public_profile", "email"], from: controller) { [weak self] result, error in
            guard let self = self else { return }
            guard error == nil, let token = result?.token?.tokenString else { return }
            let parms = [
                "provider" : "facebook",
                "token" : token
            ]
            // Send data to back end
            self.tokenSignIn(url: URLs.external.rawValue, parms: parms)
        }
    }
    // Login with google
    
    func loginWithGoogle(controller: UIViewController) {
        GIDSignIn.sharedInstance.signIn(withPresenting: controller) { signInResult, error in
            guard error == nil else { return }
            guard let signInResult = signInResult else { return }
            
            signInResult.user.refreshTokensIfNeeded { [weak self] user, error in
                guard let self = self else { return }
                guard error == nil else { return }
                guard let user = user else { return }
                
                let idToken = user.idToken
                // Send ID token to backend
                let parms = [
                    "provider" : "google",
                    "token" : idToken?.tokenString ?? ""
                ]
                self.tokenSignIn(url: URLs.external.rawValue, parms: parms)
            }
        }
    }
    
    // func send token to signin
    func tokenSignIn(url: String, parms: [String: Any]) {
        let ExtrnalLoginObject = NetworkManger(url: URLs.external.rawValue, method: .post, parms: parms, header: nil)
        
        ExtrnalLoginObject.request(modal: ProfileModel.self) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let user):
                print(user)
                UserDefaults.standard.set(user.token ?? "", forKey: "UserToken")
                UserData.fetchUserInfo { response in
                    switch response {
                    case .success(_):
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
    // SginUp
    func signUp() {
        view?.goToRegisterVC()
    }
}
