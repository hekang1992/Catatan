//
//  UserViewController.swift
//  Catatan
//
//  Created by apple on 2024/2/26.
//

import UIKit
import JXGradientKit
import TYAlertController
import MBProgressHUD_WJExtension

class UserViewController: BaseViewController {
    
    lazy var userView: ProfileView = {
        let userView = ProfileView()
        return userView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        view.addSubview(bgView)
        bgView.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }
        bgView.addSubview(userView)
        userView.snp.makeConstraints { make in
            make.edges.equalTo(bgView)
        }
        userView.blcok = {[weak self] index,title in
            self?.indexWithVc(index,title)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.showTabBar()
    }
    
    func indexWithVc(_ index: NSInteger, _ title: String) {
        switch index {
        case 0...2:
            orderListVc(index,title)
            break
        case 3:
            email()
            break
        case 4:
            logoutAccount()
            break
        case 5:
            deleteAccount()
            break
        default:
            break
        }
    }
    
    func orderListVc(_ index: NSInteger, _ title: String) {
        let orderVc = OrderViewController()
        orderVc.nameStr = title
        orderVc.typeStr = String(7 - index)
        orderVc.hideTabBar()
        self.navigationController?.pushViewController(orderVc, animated: true)
    }
    
    func email() {
        let aboutVc = AboutViewController()
        aboutVc.hideTabBar()
        self.navigationController?.pushViewController(aboutVc, animated: true)
    }
    
    func logoutAccount() {
        let exitView = ExitView()
        exitView.frame = self.view.bounds
        let alertVC = TYAlertController(alert: exitView, preferredStyle: .alert)
        self.present(alertVC!, animated: true)
        exitView.block = { [weak self] in
            self?.dismiss(animated: true, completion: {
                self?.logout()
            })
        }
        exitView.cblock = { [weak self] in
            self?.dismiss(animated: true)
        }
    }
    
    func logout() {
        addHudView()
        let dict: [String: Any] = [:]
        NetApiWork.shared.requestAPI(params: dict, pageUrl: obliteratedYears, method: .get) { [weak self] model in
            let awess = model.awareness
            let edges = model.edges
            if awess == 0 || awess == 00 {
                SaveLoginInfo.removeLoginInfo()
                CNotificationCenter.post(name: NSNotification.Name(SET_ROOTVC), object: nil)
            }
            self?.removeHudView()
            MBProgressHUD.wj_showPlainText(edges ?? "", view: nil)
        } errorBlock: { [weak self] error in
            self?.removeHudView()
        }
    }
    
    func deleteAccount() {
        let delView = DeleteView()
        delView.frame = self.view.bounds
        let alertVC = TYAlertController(alert: delView, preferredStyle: .actionSheet)
        self.present(alertVC!, animated: true)
        delView.block1 = { [weak self] in
            self?.dismiss(animated: true)
        }
        delView.block2 = { [weak self] in
            //sure
            self?.dismiss(animated: true,completion: {
                self?.sureDel()
            })
        }
        delView.block3 = { [weak self] in
            self?.dismiss(animated: true)
        }
    }
    
    func sureDel() {
        addHudView()
        let dict: [String: Any] = [:]
        NetApiWork.shared.requestAPI(params: dict, pageUrl: familiarHeadless, method: .get) { [weak self] model in
            let awess = model.awareness
            let edges = model.edges
            if awess == 0 || awess == 00 {
                SaveLoginInfo.removeLoginInfo()
                CNotificationCenter.post(name: NSNotification.Name(SET_ROOTVC), object: nil)
            }
            self?.removeHudView()
            MBProgressHUD.wj_showPlainText(edges ?? "", view: nil)
        } errorBlock: { [weak self] error in
            self?.removeHudView()
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
