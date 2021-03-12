//
//  TabBarViewController.swift
//  DemoApp
//
//  Created by 倪申雷 on 2021/3/12.
//

import UIKit

class SLTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    static var customViewControllers: [UIViewController] {
        let home = HomeViewController()
        home.tabBarItem.title = "首页"
        home.tabBarItem.image = UIImage(named: "home")
        home.tabBarItem.selectedImage = UIImage(named: "home_selected")
        
        let message = MessageViewController()
        message.tabBarItem.title = "消息"
        message.tabBarItem.image = UIImage(named: "message")
        message.tabBarItem.selectedImage = UIImage(named: "message_selected")
        
        let mine = MineViewController()
        mine.tabBarItem.title = "我的"
        mine.tabBarItem.image = UIImage(named: "mine")
        mine.tabBarItem.selectedImage = UIImage(named: "mine_selected")
        
        return [home, message, mine]
    }

}
