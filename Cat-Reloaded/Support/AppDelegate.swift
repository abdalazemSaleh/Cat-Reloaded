//
//  AppDelegate.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2022-10-03.
//

import UIKit
import Firebase
import FirebaseMessaging
import UserNotifications
import FBSDKCoreKit
import GoogleSignIn


@main
class AppDelegate: UIResponder, UIApplicationDelegate {
        
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        ApplicationDelegate.shared.application(application, didFinishLaunchingWithOptions: launchOptions)
        sleep(1)

        FirebaseApp.configure()
        registerForPushNotifications()

        return true
    }
    
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        ApplicationDelegate.shared.application(app, open: url, sourceApplication: options[UIApplication.OpenURLOptionsKey.sourceApplication] as? String,annotation: options[UIApplication.OpenURLOptionsKey.annotation])
        // handel google signin url
        var handled: Bool
        handled = GIDSignIn.sharedInstance.handle(url)
        if handled {
            return true
        }
        return false
    }
}

extension AppDelegate: MessagingDelegate, UNUserNotificationCenterDelegate {
    private func registerForPushNotifications() {
        Messaging.messaging().delegate = self
        UNUserNotificationCenter.current().delegate = self
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) {
            (granted, error) in
            guard granted else { return }
            DispatchQueue.main.async {
                UIApplication.shared.registerForRemoteNotifications()
            }
        }
    }
    
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
        messaging.token { token, _ in
            guard let token = token else { return }
            print("Token is \(token)")
        }
    }    
}
