//
//  AppDelegate.swift
//  Catatan
//
//  Created by apple on 2024/2/26.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow.init(frame: UIScreen.main.bounds)
        window?.rootViewController = FristViewController()
        window?.makeKeyAndVisible()
        return true
    }
    
}

