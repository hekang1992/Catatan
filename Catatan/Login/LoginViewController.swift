//
//  LoginViewController.swift
//  Catatan
//
//  Created by apple on 2024/2/26.
//

import UIKit
import MBProgressHUD_WJExtension
import HandyJSON

class LoginViewController: BaseViewController {
    
    var timer: Timer?
    
    var seconds = 60
    
    var btn: UIButton?

    lazy var loginView: LoginView = {
        let loginView = LoginView(frame: CGRect.zero)
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
            self?.disMissLoginVc()
        }
        loginView.block1 = { [weak self] btn in
            self?.btn = btn
            self?.codeTime(btn)
        }
        loginView.block2 = { [weak self] in
            self?.requsetLogin()
        }
    }
    
    func disMissLoginVc() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func codeTime(_ btn: UIButton) {
        let emailT: String = loginView.emailT.text ?? ""
        if emailT.isEmpty {
            MBProgressHUD.wj_showPlainText("Please enter your phone number", view: nil)
        }else{
            self.getCode()
        }
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        if seconds > 0 {
            seconds -= 1
            loginView.countdownButton.setTitle("Resend(\(seconds))", for: .normal)
        } else {
            stopTimer()
            loginView.countdownButton.isEnabled = true // 启用按钮
            loginView.countdownButton.setTitle("Kirim kode verifikasi", for: .normal)
        }
    }
    
    func stopTimer() {
        timer?.invalidate()
        timer = nil
        seconds = 60
    }
    
    func getCode() {
        let grieving = loginView.emailT.text!
        let dict = ["grieving":grieving]
        addHudView()
        NetApiWork.shared.requestAPI(params: dict as [String : Any], pageUrl: fivedayTravel, method: .post) { [weak self] model in
            let awareness = model.awareness
            let edges = model.edges
            if awareness == 0 || awareness == 00 {
                self?.btn!.isEnabled = false
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
        let badly = loginView.passT.text!
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
                CNotificationCenter.post(name: NSNotification.Name(SET_ROOTVC), object: nil)
            }
            self?.removeHudView()
            MBProgressHUD.wj_showPlainText(edges!, view: nil)
        } errorBlock: { [weak self] error in
            self?.removeHudView()
        }
    }
    
}
