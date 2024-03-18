//
//  AppDelegate.swift
//  Catatan
//
//  Created by apple on 2024/2/26.
//

import UIKit
import IQKeyboardManagerSwift
import AppTrackingTransparency

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow.init(frame: UIScreen.main.bounds)
        noti()
        keyboardManager()
//        getFontNames()
        window?.rootViewController = FristViewController()
        window?.makeKeyAndVisible()
        return true
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        if #available(iOS 14.0, *) {
            ATTrackingManager.requestTrackingAuthorization { status in
                // Handle the tracking authorization status if needed
            }
        }
    }
    
    func keyboardManager(){
        IQKeyboardManager.shared.keyboardDistanceFromTextField = 5.pix()
        IQKeyboardManager.shared.shouldResignOnTouchOutside = true
        IQKeyboardManager.shared.enable = true
    }
    
    func noti(){
        CNotificationCenter.addObserver(self, selector: #selector(setUpRootVc(_:)), name: NSNotification.Name(SET_ROOTVC), object: nil)
    }
    
    @objc func setUpRootVc(_ notification: Notification){
        windowAnimation()
        if let userInfo = notification.userInfo {
            if let value = userInfo["cleaved"] as? String {
                if value == "uu" {
                    window?.rootViewController = TabBarViewController()
                }else{
                    window?.rootViewController = OAViewController()
                }
            }
        }
    }
    
    func windowAnimation() {
        let transition = CATransition()
        transition.duration = 0.25
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        self.window?.layer.add(transition, forKey: "animation")
    }
    
    func getFontNames() {
        let familyNames = UIFont.familyNames
        for familyName in familyNames {
            let fontNames = UIFont.fontNames(forFamilyName: familyName)
            for fontName in fontNames {
                print("--------\tfontName-------- = \(fontName)")
            }
        }
    }
}


