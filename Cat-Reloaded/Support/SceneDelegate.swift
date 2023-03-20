//
//  SceneDelegate.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2022-10-03.
//

import UIKit
import Alamofire

struct UserInfo: Codable {
    let id: String?
    let fullName: String?
    let email: String?
    let phoneNumber: String?
    let isCatian: Bool?
    let title: String?
    let imageUrl: String?
    let techCircle: String?
    let techRole: String?
    let nonTechCircle: String?
    let nonTechRole: String?
    let generation: String?
}

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window                      = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene         = windowScene
        window?.makeKeyAndVisible()

//        if UserData.getUserModel() != nil {
//            window?.rootViewController = GFTabBarController()
//        } else {
//            window?.rootViewController  = GFNavigationController()
//        }
        let isUserLogin = UserDefaults.standard.bool(forKey: "UserLogin")
        if isUserLogin {
            UserData.fetchUserInfo { response in
                switch response {
                case .success(_):
                    self.window?.rootViewController = GFTabBarController()
                case .failure(let error):
                    print(error.rawValue)
                    self.window?.rootViewController  = GFNavigationController()
                }
            }
        } else {
            window?.rootViewController  = GFNavigationController()
        }
        guard let theme = UserDefaults.standard.string(forKey: "theme") else { return }
        if theme == "Dark mode" {
            window?.overrideUserInterfaceStyle = .dark
        } else if theme == "Light mode" {
            window?.overrideUserInterfaceStyle = .light
        } else {
            window?.overrideUserInterfaceStyle = .unspecified
        }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
    }

    func sceneWillResignActive(_ scene: UIScene) {
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
    }

    private func getUserInfo() {
        let token = UserDefaults.standard.string(forKey: "UserToken") ?? ""
        let header: HTTPHeaders = [
            "Authorization": "Bearer " + token,
        ]
        let fetchUserInfo = NetworkManger(url:"/user/info", method: .get, parms: nil, header: header)
        fetchUserInfo.request(modal: UserInfo.self) { [weak self] response in
            guard let self = self else { return }
            switch response {
            case .success(let user):
                UserData.chacheUserModel(user: user)
                self.window?.rootViewController = GFTabBarController()
            case .failure(let error):
                UserDefaults.standard.set(false, forKey: "UserLogin")
                print(error.rawValue)
                self.window?.rootViewController  = GFNavigationController()
            }
        }
    }
}

