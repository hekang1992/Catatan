//
//  BaseViewController.swift
//  Catatan
//
//  Created by apple on 2024/2/26.
//

import UIKit
import JXGradientKit

class BaseViewController: UIViewController,UINavigationControllerDelegate {
    
    lazy var bgView: GradientView = {
        let bgView = GradientView()
        let topColer = UIColor("#E4D7EF")
        let minColer = UIColor("#DEE9CF")
        let booColer = UIColor("#E2EFF3")
        bgView.direction = GradientDirection.topToBottom
        bgView.startColor = topColer
        bgView.middleColor = minColer
        bgView.endColor = booColer
        return bgView
    }()
    
    lazy var navView: CNavView = {
        let view = CNavView()
        view.frame = .zero
        return view
    }()
    
    lazy var hud: HudView = {
        let hud = HudView()
        hud.frame = CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT)
        return hud
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.delegate = self
        // Do any additional setup after loading the view.
        view.addSubview(bgView)
        bgView.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }
    }
    
    func showTabBar() {
        if let tabbarVc = UIApplication.shared.delegate?.window??.rootViewController as? TabBarViewController {
            tabbarVc.showTabBar()
        }
    }
    
    func hideTabBar() {
        if let tabbarVc = UIApplication.shared.delegate?.window??.rootViewController as? TabBarViewController {
            tabbarVc.hideTabBar()
        }
    }
    
    func addNavView() {
        view.addSubview(navView)
        navView.snp.makeConstraints { make in
            make.left.right.top.equalTo(view)
            make.height.equalTo(NAV_HIGH)
        }
    }
    
    func addHudView() {
        if let keyWindow = UIApplication.shared.keyWindow {
            keyWindow.addSubview(hud)
        }
    }
    
    func removeHudView() {
        hud.removeFromSuperview()
    }
    
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        // 禁用侧滑返回
        navigationController.interactivePopGestureRecognizer?.isEnabled = false
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

