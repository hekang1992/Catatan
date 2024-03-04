//
//  UserFactory.swift
//  Catatan
//
//  Created by apple on 2024/3/4.
//

import UIKit

class UserFactory: NSObject {

    static func getUserSessionId() -> String {
        let token: String? = USER_DEFAULTS.value(forKey: LOGIN_SEIZES) as? String
        return token ?? ""
    }

    static func checkIsLogin(topViewController : UIViewController) -> Bool {
        if getUserSessionId().count == 0 {
            let loginVC: LoginViewController = LoginViewController()
            let nav: BaseNavViewController = BaseNavViewController(rootViewController: loginVC)
            nav.modalPresentationStyle = .fullScreen
            topViewController.present(nav, animated: true)
            return false
        }else {
            return true
        }
    }
    
}
