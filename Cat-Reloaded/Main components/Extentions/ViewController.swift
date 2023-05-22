//
//  ViewController.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2022-10-04.
//

import UIKit

enum SocialMediaNav: String {
    case youtube    = "youtube"
    case facebook   = "facebook"
    case linkedin   = "linkedin"
    case github     = "github"
    case twitter    = "twitter"
}

extension UICollectionViewCell {
    func openSocialMedia(with link: String, type: SocialMediaNav) {
        var urlComponents = link.components(separatedBy: ".com/")
        
        if type == .twitter {
            urlComponents = link.components(separatedBy: "in/")
        } else if type == .youtube {
            urlComponents   = link.components(separatedBy: "=")
        }
        
        let urlId         = urlComponents.last ?? ""
        var url           = URL(string: "\(type.rawValue)://\(urlId)")!
        
        if UIApplication.shared.canOpenURL(url as URL){
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            url = URL(string:link)!
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}

extension UIViewController {
    
    func nav(vc: UIViewController) {
        navigationController?.pushViewController(vc, animated: false)
    }
    
    @objc func dismis() {
       self.navigationController?.popViewController(animated: true)
    }
    
    func add_openCardButton() {
        let cardButton = UIButton(type: .system)
        cardButton.setImage(Images.card, for: .normal)
        cardButton.tintColor = Colors.mainColor
        cardButton.addTarget(self, action: #selector(presentCardVC), for: .touchUpInside)
        
        let notificationButton = UIButton(type: .system)
        notificationButton.setImage(Images.notification, for: .normal)
        notificationButton.tintColor = .secondaryLabel
        notificationButton.addTarget(self, action: #selector(openNotificationsVC), for: .touchUpInside)
        
        let cardButtonItem          = UIBarButtonItem(customView: cardButton)
        let notificationButtonItem  = UIBarButtonItem(customView: notificationButton)
        
        if UserData.getUserModel()?.isCatian ?? false  {
            navigationItem.rightBarButtonItems = [notificationButtonItem, cardButtonItem]
        } else {
            navigationItem.rightBarButtonItem = notificationButtonItem
        }
    }
    
    @objc private func presentCardVC() {
        if UserData.getUserModel()?.isCatian ?? false  {
            let cardVC = CardVC()
            cardVC.modalPresentationStyle  = .overFullScreen
            cardVC.modalTransitionStyle    = .crossDissolve
            self.present(cardVC, animated: true)
        } else {
            presentGFAlert(title: "Woops", message: "You need to become a CATian to show your card.", buttonTitle: "OK")
        }
    }
    
    @objc private func openNotificationsVC() {
        presentGFAlert(title: "Woops", message: "We working on it", buttonTitle: "OK")
    }
    
    func presentGFAlert(title: String, message: String, buttonTitle: String) {
        let alertVC = GFAlertVC(title: title, message: message, buttonTitle: buttonTitle)
        alertVC.modalPresentationStyle  = .overFullScreen
        alertVC.modalTransitionStyle    = .crossDissolve
        self.present(alertVC, animated: true)
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
    
    func presentPhoto(with imageUrl: String) {
        let vc = Full_imageVC()
        vc.imageUrl = imageUrl
        vc.modalPresentationStyle   = .overFullScreen
        vc.modalTransitionStyle     = .crossDissolve
        present(vc, animated: true)
    }
        
    func openPodCat(with link: String) {
        let urlComponents   = link.components(separatedBy: "=")
        
        let urlId         = urlComponents.last ?? ""
        var url           = URL(string: "youtube://\(urlId)")!
        
        if UIApplication.shared.canOpenURL(url as URL){
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            url = URL(string:link)!
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
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

extension UIViewController {
//    func showEmptyStateView(completion: ) {
//        DispatchQueue.main.async {
//            let emptyStateView = GFEmptyStateView()
//            emptyStateView.retryButton.addTarget(self, action: selector, for: .touchUpInside)
//            emptyStateView.frame = self.view.bounds
//            self.view.addSubview(emptyStateView)
//        }
//    }
}
