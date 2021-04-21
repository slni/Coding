//
//  04-ReadMe.swift
//  DemoApp
//
//  Created by 倪申雷 on 2021/4/21.
//
import UIKit
import UserNotifications

/**
 推送的分类:
 * 本地推送
 * 远程推送
 */


/**
 注册通知, 获取用户权限
 */
func registerAPN() {
    let center = UNUserNotificationCenter.current()
    center.requestAuthorization(options: [.alert, .sound]) { (isSuccess, error) in
        
    }
}


/**
 添加通知
 */
func addLocalNotice() {
    let content = UNMutableNotificationContent()
    content.title = "测试标题"
    content.subtitle = "测试通知副标题"
    content.body = "测试通知的具体内容"
    content.sound = .default
    // 角标
    content.badge = 1
    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 8, repeats: false)
    let request = UNNotificationRequest(identifier: "ID9523", content: content, trigger: trigger)
    let center = UNUserNotificationCenter.current()
    center.add(request) { (error) in
        print(error.debugDescription)
    }
}

/**
 移除通知
 */
func removeOne(identifier: String) {
    let center = UNUserNotificationCenter.current()
    center.getPendingNotificationRequests { (requests) in
        requests.forEach { (req) in
            print("存在的ID:\(req.identifier)")
        }
        print("移除currentID:\(identifier)")
    }
    center.removeDeliveredNotifications(withIdentifiers: [identifier])
}

func removeAll() {
    let center = UNUserNotificationCenter.current()
    center.removeAllPendingNotificationRequests()
}


/**
 检查授权情况
 */
func checkEnable() {
    let center = UNUserNotificationCenter.current()
    center.getNotificationSettings { (settings) in
        print(settings.notificationCenterSetting)
    }
}
