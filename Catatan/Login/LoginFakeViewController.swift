//
//  LoginFakeViewController.swift
//  Catatan
//
//  Created by apple on 2024/3/27.
//

import UIKit
import MBProgressHUD_WJExtension
import HandyJSON

class LoginFakeViewController: BaseViewController {
    
    var countdownTimer: Timer!
    var totalTime = 60
    
    lazy var loginView: LoginFakeView = {
        let loginView = LoginFakeView()
        return loginView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        view.addSubview(loginView)
        loginView.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }
        loginView.block = { [weak self] in
            self?.dismiss(animated: true)
        }
        loginView.block1 = { [weak self] in
            self?.getCode()
        }
        loginView.block2 = { [weak self] in
            self?.requsetLogin()
        }
    }
    
    func startTimer() {
        self.loginView.codeBtn.isEnabled = false
        countdownTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }
    
    @objc func updateTime() {
        if totalTime > 0 {
            totalTime -= 1
            UIView.animate(withDuration: 0.25) {
                self.loginView.codeBtn.snp.updateConstraints { make in
                    make.size.equalTo(CGSizeMake(35, 35))
                }
                self.loginView.layoutIfNeeded()
            } completion: { bool in
                self.loginView.codeBtn.setTitle("\(self.totalTime)", for: .normal)
            }
        } else {
            endTimer()
        }
    }
    
    func endTimer() {
        countdownTimer.invalidate()
        MBProgressHUD.wj_showPlainText("123", view: nil)
        self.loginView.codeBtn.isEnabled = true
        self.loginView.codeBtn.setTitle("Send code", for: .normal)
        UIView.animate(withDuration: 0.25) {
            self.loginView.codeBtn.snp.updateConstraints { make in
                make.size.equalTo(CGSizeMake(106.pix(), 35.pix()))
            }
            self.loginView.layoutIfNeeded()
        }
        totalTime = 60
    }
    
    func getCode() {
        let grieving = loginView.emailT.text!
        let dict = ["grieving":grieving]
        addHudView()
        NetApiWork.shared.requestAPI(params: dict as [String : Any], pageUrl: fivedayTravel, method: .post) { [weak self] model in
            let awareness = model.awareness
            let edges = model.edges
            if awareness == 0 || awareness == 00 {
                self?.startTimer()
            }
            self?.removeHudView()
            MBProgressHUD.wj_showPlainText(edges ?? "", view: nil)
        } errorBlock: { [weak self] error in
            self?.removeHudView()
        }
    }
    
    func requsetLogin() {
        let postmaster = loginView.emailT.text!
        let badly = loginView.emailT1.text!
        let dict = ["postmaster":postmaster,"badly":badly]
        addHudView()
        NetApiWork.shared.requestAPI(params: dict, pageUrl: neverSelfconfident, method: .post) { [weak self] model in
            let awareness = model.awareness
            let edges = model.edges
            if awareness == 0 || awareness == 00 {
                let hovered = model.hovered
                let loginModel = JSONDeserializer<HoveredModel>.deserializeFrom(dict: hovered)
                guard let loginModel = loginModel else { return }
                SaveLoginInfo.removeLoginInfo()
                SaveLoginInfo.saveLoginInfo(loginModel.seizes ?? "", loginModel.postmaster ?? "")
                let dict = ["cleaved":"aa"]
                CNotificationCenter.post(name: NSNotification.Name(SET_ROOTVC), object: nil, userInfo: dict)
            }
            self?.removeHudView()
            MBProgressHUD.wj_showPlainText(edges!, view: nil)
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
