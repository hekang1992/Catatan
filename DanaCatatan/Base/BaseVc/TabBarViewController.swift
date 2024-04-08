//
//  TabBarViewController.swift
//  Catatan
//
//  Created by apple on 2024/2/26.
//

import UIKit

class TabBarViewController: UITabBarController,YBTabBarDelegate {
    
    var customTabBar: CTabBar?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.addTabBar()
        self.setupAllChildViewControllers()
    }
    
    func addTabBar(){
        let viewSize = self.view.bounds.size
        let tabBarStartingY = viewSize.height
        let tabBarHeight: CGFloat = TabBarHeight
        let customTabBar = CTabBar(frame: CGRectMake(0, tabBarStartingY - tabBarHeight - 30.pix(), viewSize.width, tabBarHeight + 30.pix()))
        customTabBar.delegate = self
        self.customTabBar = customTabBar
        self.view.addSubview(customTabBar)
    }
    
    func setupAllChildViewControllers(){
        let homeVc = HomeViewController()
        let userVc = UserViewController()
        self.setupChildViewController(childVc: homeVc, title: "Beranda", imageName: "home1", selectedImageName: "home")
        self.setupChildViewController(childVc: userVc, title: "Pengguna", imageName: "user1", selectedImageName: "user")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        for child in self.tabBar.subviews {
            if let control = child as? UIControl {
                control.removeFromSuperview()
            }
        }
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
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
    
    func ybTabBar(_ tabBar: CTabBar, didSelectedButtonFrom from: Int, to: Int) {
//        print("from>>>>to>>>>\(from)------\(to)")
        if from == to {
            return
        }
        let isLogin: String = USER_DEFAULTS.object(forKey: LOGIN_SEIZES) as? String ?? ""
        if isLogin.isEmpty {
            self.loginVc()
            return
        }
        selectedIndex = to
    }
    
    func loginVc() {
        let login = LoginViewController()
        let nav = BaseNavViewController(rootViewController: login)
        nav.modalPresentationStyle = .overFullScreen
        present(nav, animated: true, completion: nil)
    }
    
    func setupChildViewController(childVc: UIViewController, title: String, imageName: String, selectedImageName: String) {
        childVc.title = title
        childVc.tabBarItem.image = UIImage(named: imageName)
        if let selectedImage = UIImage(named: selectedImageName)?.withRenderingMode(.alwaysOriginal) {
            childVc.tabBarItem.selectedImage = selectedImage
        }
        let nav = BaseNavViewController(rootViewController: childVc)
        addChild(nav)
        customTabBar?.addTabBarButtonNorImageUrl(imageName, selImageUrl: selectedImageName, title: title)
    }
    
    func showTabBar() {
        if let customTabBar = self.customTabBar {
            UIView.animate(withDuration: 0.25) {
                var frame = customTabBar.frame
                frame.origin.y = self.view.bounds.size.height - TabBarHeight - 26.pix()
                customTabBar.frame = frame
            }
        }
    }
    
    func hideTabBar() {
        if let customTabBar = self.customTabBar {
            UIView.animate(withDuration: 0.25) {
                var frame = customTabBar.frame
                frame.origin.y = self.view.bounds.size.height
                customTabBar.frame = frame
            }
        }
    }
    
}
