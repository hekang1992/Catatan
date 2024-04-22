//
//  AboutViewController.swift
//  Catatan
//
//  Created by apple on 2024/3/1.
//

import UIKit
import MBProgressHUD_WJExtension

class AboutViewController: BaseViewController {
    
    lazy var nameLable1: UILabel = {
        let nameLable = UILabel.createLabel(font: UIFont.systemFont(ofSize: 16, weight: .medium), textColor: .black, textAlignment: .left)
        nameLable.text = "Hai, pelanggan yang terhormat"
        return nameLable
    }()
    
    lazy var nameLable2: UILabel = {
        let nameLable = UILabel.createLabel(font: UIFont.systemFont(ofSize: 14, weight: .regular), textColor: UIColor(TITLE_COLOR), textAlignment: .left)
        nameLable.text = "Saya senang bisa melayani Anda"
        return nameLable
    }()
    
    lazy var aboutView1: AboutView = {
        let aboutView = AboutView()
        let originalString = "Surel\nshahphai@outlook.com"
        aboutView.iconImageView.image = UIImage(named: "iocn2")
        let startIndex = 5
        let endIndex = originalString.count
        let range = NSRange(location: startIndex, length: endIndex - startIndex)
        let attributedString = NSMutableAttributedString(string: originalString)
        attributedString.addAttribute(.font, value: UIFont.systemFont(ofSize: 14, weight: .regular), range: range)
        aboutView.nameLable.attributedText = attributedString
        return aboutView
    }()
    
    lazy var aboutView2: AboutView = {
        let aboutView = AboutView()
        let originalString = "Telepon\n9311014565(10:00-18:00)"
        aboutView.iconImageView.image = UIImage(named: "iocn3")
        let startIndex = 7
        let endIndex = originalString.count
        let range = NSRange(location: startIndex, length: endIndex - startIndex)
        let attributedString = NSMutableAttributedString(string: originalString)
        attributedString.addAttribute(.font, value: UIFont.systemFont(ofSize: 14, weight: .regular), range: range)
        aboutView.nameLable.attributedText = attributedString
        return aboutView
    }()
    
    lazy var aboutView3: AboutView = {
        let aboutView = AboutView()
        let originalString = "Whats App\n9311014565"
        aboutView.iconImageView.image = UIImage(named: "iocn4")
        let startIndex = 9
        let endIndex = originalString.count
        let range = NSRange(location: startIndex, length: endIndex - startIndex)
        let attributedString = NSMutableAttributedString(string: originalString)
        attributedString.addAttribute(.font, value: UIFont.systemFont(ofSize: 14, weight: .regular), range: range)
        aboutView.nameLable.attributedText = attributedString
        return aboutView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        addNavView()
        navView.nameLabel.text = "Layanan pelanggan"
        navView.block = { [weak self] in
            self?.navigationController?.popViewController(animated: true)
        }
        view.addSubview(nameLable1)
        view.addSubview(nameLable2)
        nameLable1.snp.makeConstraints { make in
            make.left.equalTo(bgView).offset(28)
            make.height.equalTo(22)
            make.top.equalTo(navView.snp_bottomMargin).offset(17)
        }
        nameLable2.snp.makeConstraints { make in
            make.left.equalTo(bgView).offset(28)
            make.height.equalTo(22)
            make.top.equalTo(nameLable1.snp.bottom).offset(2)
        }
        view.addSubview(aboutView1)
//        view.addSubview(aboutView2)
//        view.addSubview(aboutView3)
        aboutView1.snp.makeConstraints { make in
            make.left.equalTo(bgView)
            make.centerX.equalTo(bgView)
            make.top.equalTo(nameLable2.snp_bottomMargin).offset(28)
            make.height.equalTo(89)
        }
//        aboutView2.snp.makeConstraints { make in
//            make.left.equalTo(bgView)
//            make.centerX.equalTo(bgView)
//            make.top.equalTo(aboutView1.snp_bottomMargin).offset(20)
//            make.height.equalTo(89)
//        }
//        aboutView3.snp.makeConstraints { make in
//            make.left.equalTo(bgView)
//            make.centerX.equalTo(bgView)
//            make.top.equalTo(aboutView2.snp_bottomMargin).offset(20)
//            make.height.equalTo(89)
//        }
        aboutView1.block = { [weak self] in
            self?.pushEmail()
        }
//        aboutView2.block = { [weak self] in
//            self?.pushPhone()
//        }
//        aboutView3.block = { [weak self] in
//            self?.pushApp()
//        }
    }
    
    func pushEmail() {
        let email = "shahphai@outlook.com"
        if let emailURL = URL(string: "mailto:\(email)"), UIApplication.shared.canOpenURL(emailURL) {
            UIApplication.shared.open(emailURL, options: [:], completionHandler: nil)
        }
    }
    
    func pushPhone() {
        let phoneNumber = "9311014565"
        if let phoneURL = URL(string: "tel://\(phoneNumber)"), UIApplication.shared.canOpenURL(phoneURL) {
            UIApplication.shared.open(phoneURL, options: [:], completionHandler: nil)
        } else {
            
        }
    }
    
    func pushApp() {
        let phoneNumber = "9311014565"
        if let whatsappURL = URL(string: "https://wa.me/\(phoneNumber)"), UIApplication.shared.canOpenURL(whatsappURL) {
            UIApplication.shared.open(whatsappURL, options: [:], completionHandler: nil)
        } else {
            MBProgressHUD.wj_showPlainText("Tidak diinstal WhatsApp.", view: nil)
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
