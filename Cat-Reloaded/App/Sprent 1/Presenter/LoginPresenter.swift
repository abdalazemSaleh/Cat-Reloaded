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
        let loginObject = NetworkManger(url: URLs.login.rawValue, method: .post, parms: parms, header: nil)
        loginObject.request(modal: ProfileModel.self) { [weak self] result in
            guard let self = self else { return }
            self.view?.stopAnimation()
            
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
        view?.startAnimation()
        let loginManger = LoginManager()
        loginManger.logIn(permissions: ["public_profile", "email"], from: controller) { result, error in
            guard error == nil, let token = result?.token?.tokenString else { return }
            print(token)
            let parms = [
                "provider" : "facebook",
                "token" : token
            ]
            // Send data to back end
            let loginWithFacebookObject = NetworkManger(url: URLs.external.rawValue, method: .post, parms: parms, header: nil)
            loginWithFacebookObject.request(modal: ProfileModel.self) { [weak self] result in
                guard let self = self else { return }
                self.view?.stopAnimation()

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
                    self.view?.alertMessage(message: error.localizedDescription)
                }
            }
        }
    }
    // Login with google
    func loginWithGoogle(controller: UIViewController) {
        view?.startAnimation()
        let signInConfig = GIDConfiguration(clientID: "783608969759-0brae1mhmc6nnrl682teqi6lr8onhm49.apps.googleusercontent.com")
        GIDSignIn.sharedInstance.signIn(with: signInConfig, presenting: controller) { user, error in
            self.view?.stopAnimation()
            guard error == nil else { return }
            guard let user = user else { return }
            user.authentication.do { authentication, error in
                guard let token = authentication?.idToken else { return }
                // Send ID token to backend
                let parms = [
                    "provider" : "google",
                    "token" : token
                ]
                // send data to back end
                let loginWithGoogle = NetworkManger(url: URLs.external.rawValue, method: .post, parms: parms, header: nil)
                loginWithGoogle.request(modal: ProfileModel.self) { [weak self] result in
                    guard let self = self else { return }

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
                        self.view?.alertMessage(message: error.localizedDescription)
                    }
                }
            }
        }
    }
    // SginUp
    func signUp() {
        view?.goToRegisterVC()
    }
}
