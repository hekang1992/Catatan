//
//  AboutViewController.swift
//  Catatan
//
//  Created by apple on 2024/3/1.
//

import UIKit

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
        let originalString = "Surel\nkreditinstan@gmail.com"
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
        let originalString = "Telepon\n22222222(10:00-18:00)"
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
        let originalString = "Whats App\n222222222"
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
        view.addSubview(aboutView2)
        view.addSubview(aboutView3)
        aboutView1.snp.makeConstraints { make in
            make.left.equalTo(bgView)
            make.centerX.equalTo(bgView)
            make.top.equalTo(nameLable2.snp_bottomMargin).offset(28)
            make.height.equalTo(89)
        }
        aboutView2.snp.makeConstraints { make in
            make.left.equalTo(bgView)
            make.centerX.equalTo(bgView)
            make.top.equalTo(aboutView1.snp_bottomMargin).offset(20)
            make.height.equalTo(89)
        }
        aboutView3.snp.makeConstraints { make in
            make.left.equalTo(bgView)
            make.centerX.equalTo(bgView)
            make.top.equalTo(aboutView2.snp_bottomMargin).offset(20)
            make.height.equalTo(89)
        }
        aboutView1.block = { [weak self] in
            self?.pushEmail()
        }
        aboutView2.block = { [weak self] in
            self?.pushPhone()
        }
        aboutView3.block = { [weak self] in
            self?.pushApp()
        }
    }
    
    func pushEmail() {
        
    }
    
    func pushPhone() {
        
    }
    
    func pushApp() {
        
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
