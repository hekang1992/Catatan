//
//  LoginFakeView.swift
//  Catatan
//
//  Created by apple on 2024/3/27.
//

import UIKit
import YYText
import MBProgressHUD_WJExtension

class LoginFakeView: UIView,UITextFieldDelegate {
    
    var block: (() -> Void)?
    var block1: (() -> Void)?
    var block2: (() -> Void)?
    var block3: (() -> Void)?
    
    lazy var backBtn: UIButton = {
        let backBtn = UIButton(type: .custom)
        backBtn.setImage(UIImage.init(named: "back"), for: .normal)
        backBtn.addTarget(self, action: #selector(btnClick), for: .touchUpInside)
        return backBtn
    }()
    
    lazy var label1: UILabel = {
        let label1 = UILabel.createLabel(font: UIFont.systemFont(ofSize: 36.pix(), weight: .black), textColor: .black, textAlignment: .center)
        label1.text = "Dana Catatan"
        return label1
    }()
    
    lazy var icon: UIImageView = {
        let icon = UIImageView()
        icon.image = UIImage(named: "aaaa3")
        return icon
    }()
    
    lazy var bgView1: UIView = {
        let bgView = UIView()
        bgView.backgroundColor = .white
        bgView.layer.cornerRadius = 31
        return bgView
    }()
    
    lazy var bgView2: UIView = {
        let bgView = UIView()
        bgView.backgroundColor = .white
        bgView.layer.cornerRadius = 31
        return bgView
    }()
    
    lazy var icon1: UIImageView = {
        let icon = UIImageView()
        icon.image = UIImage(named: "ppp123")
        return icon
    }()
    
    lazy var icon2: UIImageView = {
        let icon = UIImageView()
        icon.image = UIImage(named: "ppp124")
        return icon
    }()
    
    lazy var emailT: UITextField = {
        let emailT = UITextField()
        emailT.textAlignment = .left
        emailT.textColor = .black
        emailT.keyboardType = UIKeyboardType.numberPad
        emailT.font = UIFont(name:Futura_Medium , size: 16.pix())
        emailT.delegate = self
        let placeholderAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont(name:Futura_Medium , size: 16.pix()) ?? UIFont.systemFont(ofSize: 16.pix(), weight: .regular),
            .foregroundColor:UIColor.black.withAlphaComponent(0.29)]
        emailT.attributedPlaceholder = NSAttributedString(string: "Enter your number", attributes: placeholderAttributes)
        return emailT
    }()
    
    lazy var emailT1: UITextField = {
        let emailT = UITextField()
        emailT.textAlignment = .left
        emailT.textColor = .black
        emailT.keyboardType = UIKeyboardType.numberPad
        emailT.font = UIFont(name:Futura_Medium , size: 16.pix())
        emailT.delegate = self
        let placeholderAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont(name:Futura_Medium , size: 16.pix()) ?? UIFont.systemFont(ofSize: 16.pix(), weight: .regular),
            .foregroundColor:UIColor.black.withAlphaComponent(0.29)]
        emailT.attributedPlaceholder = NSAttributedString(string: "Enter code", attributes: placeholderAttributes)
        return emailT
    }()
    
    lazy var codeBtn: UIButton = {
        let codeBtn = UIButton(type: .custom)
        codeBtn.setTitle("Send code", for: .normal)
        codeBtn.setTitleColor(.white, for: .normal)
        codeBtn.titleLabel?.font = UIFont(name: Futura_Medium, size: 16)
        codeBtn.layer.cornerRadius = 18
        codeBtn.backgroundColor = UIColor("#1355FF")
        codeBtn.addTarget(self, action: #selector(codeBtnClick), for: .touchUpInside)
        return codeBtn
    }()
    
    lazy var loginBtn: UIButton = {
        let codeBtn = UIButton(type: .custom)
        codeBtn.setTitle("Log In", for: .normal)
        codeBtn.setTitleColor(.white, for: .normal)
        codeBtn.titleLabel?.font = UIFont(name: Futura_Bold, size: 18)
        codeBtn.layer.cornerRadius = 32
        codeBtn.backgroundColor = UIColor("#1355FF")
        codeBtn.addTarget(self, action: #selector(loginClick), for: .touchUpInside)
        return codeBtn
    }()
    
    lazy var agreeMentLB: YYLabel  = {
        let agreeMentLB = YYLabel()
        agreeMentLB.numberOfLines = 0
        let text = NSMutableAttributedString(string: "By logging in or creating an account, you agree ")
        let colorText = NSMutableAttributedString(string: "Our Privacy Agreement")
        text.yy_font = UIFont.systemFont(ofSize: 14.pix())
        text.yy_color = UIColor.black
        colorText.yy_font = UIFont.systemFont(ofSize: 14.pix())
        colorText.yy_color = UIColor("#1355FF")
        text.append(colorText)
        let highlight = YYTextHighlight()
        text.yy_setTextHighlight(highlight, range: NSRange(location: 0, length: text.length))
        highlight.tapAction = { [weak self] containerView, text, range, rect in
            self?.block3?()
        }
        agreeMentLB.attributedText = text
        agreeMentLB.isUserInteractionEnabled = true
        return agreeMentLB
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor("#F4F8EE")
        addSubview(backBtn)
        addSubview(label1)
        addSubview(icon)
        addSubview(bgView1)
        addSubview(bgView2)
        bgView1.addSubview(icon1)
        bgView1.addSubview(emailT)
        bgView2.addSubview(icon2)
        bgView2.addSubview(codeBtn)
        bgView2.addSubview(emailT1)
        addSubview(loginBtn)
        addSubview(agreeMentLB)
        backBtn.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 44.pix(), height: 44.pix()))
            make.left.equalTo(self)
            make.top.equalTo(self).offset(CGFloat(STATUSBAR_HIGH) + 8.pix())
        }
        label1.snp.makeConstraints { make in
            make.centerX.equalTo(self)
            make.top.equalTo(self).offset(78.pix())
            make.height.equalTo(50.pix())
            make.left.equalTo(self)
        }
        icon.snp.makeConstraints { make in
            make.centerX.equalTo(self)
            make.top.equalTo(label1.snp_bottomMargin).offset(28.pix())
            make.size.equalTo(CGSizeMake(272, 90))
        }
        bgView1.snp.makeConstraints { make in
            make.centerX.equalTo(self)
            make.top.equalTo(icon.snp_bottomMargin).offset(32)
            make.size.equalTo(CGSizeMake(331, 62))
        }
        bgView2.snp.makeConstraints { make in
            make.centerX.equalTo(self)
            make.top.equalTo(bgView1.snp_bottomMargin).offset(30)
            make.size.equalTo(CGSizeMake(331.pix(), 62.pix()))
        }
        icon1.snp.makeConstraints { make in
            make.centerY.equalTo(bgView1)
            make.left.equalTo(bgView1).offset(17.pix())
            make.size.equalTo(CGSize(width: 35.pix(), height: 35.pix()))
        }
        icon2.snp.makeConstraints { make in
            make.centerY.equalTo(bgView2)
            make.left.equalTo(bgView2).offset(17.pix())
            make.size.equalTo(CGSize(width: 35.pix(), height: 35.pix()))
        }
        emailT.snp.makeConstraints { make in
            make.centerY.equalTo(bgView1)
            make.left.equalTo(icon1.snp_rightMargin).offset(22.pix())
            make.right.equalTo(bgView1).offset(-40.pix())
            make.height.equalTo(62.pix())
        }
        codeBtn.snp.makeConstraints { make in
            make.centerY.equalTo(bgView2)
            make.size.equalTo(CGSizeMake(106.pix(), 35.pix()))
            make.right.equalTo(bgView2).offset(-20.pix())
        }
        emailT1.snp.makeConstraints { make in
            make.centerY.equalTo(bgView2)
            make.left.equalTo(icon2.snp_rightMargin).offset(22.pix())
            make.right.equalTo(codeBtn.snp_leftMargin).offset(-20.pix())
            make.height.equalTo(62.pix())
        }
        loginBtn.snp.makeConstraints { make in
            make.centerX.equalTo(self)
            make.left.equalTo(self).offset(22.pix())
            make.height.equalTo(62.pix())
            make.bottom.equalTo(self).offset(-180.pix())
        }
        agreeMentLB.snp.makeConstraints { make in
            make.centerX.equalTo(self)
            make.top.equalTo(loginBtn.snp_bottomMargin).offset(9.pix())
            make.left.equalTo(self).offset(32.pix())
            make.height.equalTo(60.pix())
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func btnClick() {
        self.block!()
    }
    
    @objc func codeBtnClick() {
        self.block1!()
    }
    
    @objc func loginClick() {
        self.block2!()
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let newText = (textField.text as NSString?)?.replacingCharacters(in: range, with: string) ?? ""
        if textField == emailT {
            return newText.count <= 16
        }else{
            return newText.count <= 6
        }
    }
    
}
