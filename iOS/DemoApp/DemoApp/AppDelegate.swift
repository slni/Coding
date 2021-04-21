//
//  AppDelegate.swift
//  DemoApp
//
//  Created by 倪申雷 on 2021/3/5.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        let tabVC = SLTabBarViewController()
        tabVC.viewControllers = tabVC.customViewControllers.map {
            SLNavigationController(rootViewController: $0)
        }
        window?.rootViewController = tabVC
        window?.makeKeyAndVisible()
        return true
    }


}

