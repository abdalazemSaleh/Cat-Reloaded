//
//  GFTabBarController.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2022-10-11.
//

import UIKit

class GFTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        UITabBar.appearance().tintColor = Colors.mainColor
        viewControllers                 = [createHomeNC(), createCirclesNC(), createEventsNC(), createCATianNC()]
        tabBar.backgroundColor          = .secondarySystemBackground
    }
    
    
    func createHomeNC() -> UINavigationController {
        let HomeVC        = HomeVC()
        HomeVC.title      = "Home"
        HomeVC.tabBarItem = UITabBarItem(title: "Home", image: Images.Home, tag: 0)
        
        return UINavigationController(rootViewController: HomeVC)
    }
    
    func createCirclesNC() -> UINavigationController {
        let circlesVC        = CirclesVC()
        circlesVC.title      = "Circles"
        circlesVC.tabBarItem = UITabBarItem(title: "Circles", image: Images.Circles, tag: 1)

        return UINavigationController(rootViewController: circlesVC)
    }

    func createEventsNC() -> UINavigationController {
        let eventsVC        = EventsVC()
        eventsVC.title      = "Events"
        eventsVC.tabBarItem = UITabBarItem(title: "Events", image: Images.Events, tag: 2)

        return UINavigationController(rootViewController: eventsVC)
    }
    
    func createCATianNC() -> UINavigationController {
        let catianVC        = CATianVC()
        catianVC.title      = "CATians"
        catianVC.tabBarItem = UITabBarItem(title: "CATians", image: Images.Circles, tag: 3)

        return UINavigationController(rootViewController: catianVC)
    }



    
}
