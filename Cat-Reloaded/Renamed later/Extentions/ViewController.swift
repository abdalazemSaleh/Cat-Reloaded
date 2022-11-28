//
//  ViewController.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2022-10-04.
//

import UIKit

extension UIViewController {
    
    func nav(vc: UIViewController) {
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func dismis() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func presentGFAlert(title: String, message: String, buttonTitle: String) {
        DispatchQueue.main.async {
            let alertVC = GFAlertVC(title: title, message: message, buttonTitle: buttonTitle)
            alertVC.modalPresentationStyle  = .overFullScreen
            alertVC.modalTransitionStyle    = .crossDissolve
            self.present(alertVC, animated: true)
        }
    }
        
    func presentGFTabBar() {
        let tabBar = GFTabBarController()
        tabBar.modalPresentationStyle   = .overFullScreen
        tabBar.modalTransitionStyle     = .crossDissolve
        self.present(tabBar, animated: true)
    }
    
    func presentLoginScreen() {
        let vc = GFNavigationController()
        vc.modalPresentationStyle   = .overFullScreen
        vc.modalTransitionStyle     = .crossDissolve
        self.present(vc, animated: true)
    }
}


extension UIViewController {
    func initializeHideKeyboard(){
        //Declare a Tap Gesture Recognizer which will trigger our dismissMyKeyboard() function
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(dismissMyKeyboard))
        
        //Add this tap gesture recognizer to the parent view
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissMyKeyboard(){
        //endEditing causes the view (or one of its embedded text fields) to resign the first responder status.
        //In short- Dismiss the active keyboard.
        view.endEditing(true)
    }
}



extension UIViewController {
    
    func subscribeToNotification(_ notification: NSNotification.Name, selector: Selector) {
        NotificationCenter.default.addObserver(self, selector: selector, name: notification, object: nil)
    }

    func unsubscribeFromAllNotifications() {
        NotificationCenter.default.removeObserver(self)
    }
}
