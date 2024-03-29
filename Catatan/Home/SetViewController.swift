//
//  SetViewController.swift
//  Catatan
//
//  Created by apple on 2024/3/28.
//

import UIKit
import TYAlertController
import MBProgressHUD_WJExtension

class SetViewController: BaseViewController {
    
    lazy var bgView1: UIView = {
        let bgView = UIView()
        bgView.backgroundColor = UIColor("#F4F8EE")
        return bgView
    }()
    
    lazy var setView: SetView = {
        let setView = SetView()
        return setView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        addNavView()
        navView.nameLabel.text = "Bank Wealth"
        navView.block = { [weak self] in
            self?.navigationController?.popViewController(animated: true)
        }
        view.insertSubview(bgView1, belowSubview: navView)
        bgView1.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }
        bgView1.addSubview(setView)
        setView.snp.makeConstraints { make in
            make.edges.equalTo(bgView1).inset(UIEdgeInsets(top: CGFloat(NAV_HIGH), left: 0, bottom: 0, right: 0))
        }
        setView.block = { [weak self] in
            self?.imageAleet()
        }
        setView.block1 = {
            
        }
        setView.block2 = {
            
        }
        setView.block3 = {
            
        }
        setView.block4 = { [weak self] in
            if IS_LOGIN {
                self?.logout()
            }else{
                self?.pushLogin()
            }
        }
        setView.block5 = { [weak self] in
            if IS_LOGIN {
                self?.delAcc()
            }else{
                self?.pushLogin()
            }
        }
        setView.block6 = { [weak self] in
            if IS_LOGIN {
                MBProgressHUD.wj_showPlainText("chart", view: nil)
            }else{
                self?.pushLogin()
            }
        }
        setView.block7 = { [weak self] in
            if IS_LOGIN {
                let reVc = ReViewController()
                self?.navigationController?.pushViewController(reVc, animated: true)
            }else{
                self?.pushLogin()
            }
        }
    }
    
    func imageAleet() {
        let tipsView = TipsView()
        tipsView.imageV.image = UIImage(named: "successclear")
        tipsView.block = { [weak self] in
            self?.dismiss(animated: true)
        }
        tipsView.frame = self.view.bounds
        let alertVC = TYAlertController(alert: tipsView, preferredStyle: .alert, transitionAnimation: .scaleFade)
        self.present(alertVC!, animated: true)
    }
    
    func logout() {
        let tipsView = LogFOutView()
        tipsView.label.text = "Are you sure to log out of the current account?"
        tipsView.imageV.image = UIImage(named: "logoutfff")
        tipsView.block1 = { [weak self] in
            self?.dismiss(animated: true)
        }
        tipsView.block2 = { [weak self] in
            self?.dismiss(animated: true, completion: {
                self?.logoutInfo()
            })
        }
        tipsView.frame = self.view.bounds
        let alertVC = TYAlertController(alert: tipsView, preferredStyle: .alert, transitionAnimation: .scaleFade)
        self.present(alertVC!, animated: true)
    }
    
    func delAcc() {
        let tipsView = LogFOutView()
        tipsView.label.text = "This operation will completely delete all account information and cannot be restored! Whether to continue?"
        tipsView.imageV.image = UIImage(named: "logoutfff")
        tipsView.block1 = { [weak self] in
            self?.dismiss(animated: true)
        }
        tipsView.block2 = { [weak self] in
            self?.dismiss(animated: true, completion: {
                self?.deleAcc()
            })
        }
        tipsView.frame = self.view.bounds
        let alertVC = TYAlertController(alert: tipsView, preferredStyle: .alert, transitionAnimation: .scaleFade)
        self.present(alertVC!, animated: true)
    }
    
    func logoutInfo() {
        addHudView()
        delay(0.25) {
            let dict: [String: Any] = [:]
            NetApiWork.shared.requestAPI(params: dict, pageUrl: obliteratedYears, method: .get) { [weak self] model in
                let awareness = model.awareness
                let edges = model.edges
                if awareness == 0 || awareness == 00 {
                    SaveLoginInfo.removeLoginInfo()
                    let dict = ["cleaved":"aa"]
                    CNotificationCenter.post(name: NSNotification.Name(SET_ROOTVC), object: nil, userInfo: dict)
                }
                self?.removeHudView()
                MBProgressHUD.wj_showPlainText(edges ?? "", view: nil)
            } errorBlock: { [weak self] error in
                self?.removeHudView()
            }
        }
    }
    
    func deleAcc() {
        addHudView()
        delay(0.25) {
            let dict: [String: Any] = [:]
            NetApiWork.shared.requestAPI(params: dict, pageUrl: familiarHeadless, method: .get) { [weak self] model in
                let awareness = model.awareness
                let edges = model.edges
                if awareness == 0 || awareness == 00 {
                    SaveLoginInfo.removeLoginInfo()
                    let dict = ["cleaved":"aa"]
                    CNotificationCenter.post(name: NSNotification.Name(SET_ROOTVC), object: nil, userInfo: dict)
                }
                self?.removeHudView()
                MBProgressHUD.wj_showPlainText(edges ?? "", view: nil)
            } errorBlock: { [weak self] error in
                self?.removeHudView()
            }
        }
    }
    
    func pushLogin() {
        let login = LoginFakeViewController()
        let nav = BaseNavViewController(rootViewController: login)
        nav.modalPresentationStyle = .overFullScreen
        present(nav, animated: true, completion: nil)
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
