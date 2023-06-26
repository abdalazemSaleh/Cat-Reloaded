//
//  SceneDelegate.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2022-10-03.
//

import UIKit
import Alamofire

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }        
        window                      = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene         = windowScene
        window?.makeKeyAndVisible()

        let isUserLogin = UserDefaults.standard.bool(forKey: "UserLogin")
        if isUserLogin {
            Task {
                do {
                    let user = try await UserAuth().checkUserAuth()
                    print(user)
                    self.window?.rootViewController = GFTabBarController()
                } catch {
                    print(error.localizedDescription)
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
}
