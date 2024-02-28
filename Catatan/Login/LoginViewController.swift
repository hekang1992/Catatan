//
//  LoginViewController.swift
//  Catatan
//
//  Created by apple on 2024/2/26.
//

import UIKit

class LoginViewController: BaseViewController {
    
    var timer: Timer?
    var seconds = 60

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
            self?.codeTime(btn)
        }
    }
    
    func disMissLoginVc() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func codeTime(_ btn: UIButton) {
        btn.isEnabled = false
        startTimer()
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

    
    func requsetLogin() {

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
