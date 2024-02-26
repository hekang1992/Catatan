//
//  TabBarViewController.swift
//  Catatan
//
//  Created by apple on 2024/2/26.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Delete the system-generated UITabBarButton in Swift
        for child in self.tabBar.subviews {
            if let control = child as? UIControl {
                control.removeFromSuperview()
            }
        }
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        // Delete the system-generated UITabBarButton in Swift
        self.tabBar.isHidden = true
        for child in self.tabBar.subviews {
            let className = NSStringFromClass(type(of: child))
            if className == "_UIBarBackground" || className == "UIBarBackground" {
                child.isHidden = true
            }
            if let control = child as? UIControl {
                control.removeFromSuperview()
            }
        }
    }

    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
