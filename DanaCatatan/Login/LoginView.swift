//
//  LoginView.swift
//  Catatan
//
//  Created by apple on 2024/2/26.
//

import UIKit
import JXGradientKit
import YYText
import MBProgressHUD_WJExtension
import RxSwift

typealias BtnBlock = () -> Void
typealias BtnCodeBlock = (UIButton) -> Void
class LoginView: UIView ,UITextFieldDelegate{
    var block:BtnBlock?
    var block1:BtnCodeBlock?
    var block2:BtnBlock?
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
    
    lazy var backBtn: UIButton = {
        let backBtn = UIButton(type: .custom)
        backBtn.setImage(UIImage.init(named: "back"), for: .normal)
        backBtn.addTarget(self, action: #selector(btnClick), for: .touchUpInside)
        return backBtn
    }()
    
    lazy var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.textAlignment = .center
        nameLabel.text = "Buat Akun"
        nameLabel.textColor = .black
        nameLabel.font = UIFont.systemFont(ofSize: 22.pix(), weight: .semibold)
        return nameLabel
    }()
    
    lazy var emailT: UITextField = {
        let emailT = UITextField()
        emailT.textAlignment = .center
        emailT.backgroundColor = .white
        emailT.textColor = .black
        emailT.keyboardType = UIKeyboardType.numberPad
        emailT.layer.cornerRadius = 10.pix()
        emailT.delegate = self
        let placeholderAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 14.pix(), weight: .regular),
            .foregroundColor:UIColor.black.withAlphaComponent(0.29),
            .paragraphStyle:centerAlignment
        ]
        emailT.attributedPlaceholder = NSAttributedString(string: "Nomor Anda", attributes: placeholderAttributes)
        return emailT
    }()
    
    lazy var passT: UITextField = {
        let passT = UITextField()
        passT.textAlignment = .center
        passT.backgroundColor = .white
        passT.delegate = self
        passT.textColor = .black
        passT.layer.cornerRadius = 10.pix()
        passT.keyboardType = UIKeyboardType.numberPad
        let placeholderAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 14.pix(), weight: .regular),
            .foregroundColor:UIColor.black.withAlphaComponent(0.29),
            .paragraphStyle:centerAlignment
        ]
        passT.attributedPlaceholder = NSAttributedString(string: "Otentikasi Identitas", attributes: placeholderAttributes)
        return passT
    }()
    
    lazy var countdownButton: UIButton = {
        let button = UIButton(type: .system)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14.pix())
        button.contentHorizontalAlignment = .left
        button.setTitleColor(UIColor("#9FBE76"), for: .normal)
        button.setTitle("Kirim kode verifikasi", for: .normal)
        button.addTarget(self, action: #selector(startCountdown(_:)), for: .touchUpInside)
        return button
    }()
    
    lazy var loginBtn: UIButton = {
        let loginBtn = UIButton(type: .system)
        loginBtn.titleLabel?.font = UIFont.systemFont(ofSize: 14.pix())
        loginBtn.layer.cornerRadius = 10.pix()
        loginBtn.setTitleColor(UIColor("#FFFFFF"), for: .normal)
        loginBtn.setTitle("Masuk", for: .normal)
        loginBtn.backgroundColor = UIColor("#BBD598")
        loginBtn.addTarget(self, action: #selector(loginClick), for: .touchUpInside)
        return loginBtn
    }()
    
    lazy var agreeMentLB: YYLabel  = {
        let agreeMentLB = YYLabel()
        agreeMentLB.numberOfLines = 0
        let text = NSMutableAttributedString(string: "Dengan masuk atau membuat akun, Anda setuju ")
        let colorText = NSMutableAttributedString(string: "Perjanjian Privasi kami.")
        text.yy_font = UIFont.systemFont(ofSize: 12.pix())
        text.yy_color = UIColor.black
        colorText.yy_font = UIFont.systemFont(ofSize: 12.pix())
        colorText.yy_color = UIColor("#9FBE76")
        text.append(colorText)
        let highlight = YYTextHighlight()
        text.yy_setTextHighlight(highlight, range: NSRange(location: 0, length: text.length))
        highlight.tapAction = { [weak self] containerView, text, range, rect in
            MBProgressHUD.wj_showPlainText("链接被点击", view: nil)
        }
        agreeMentLB.attributedText = text
        agreeMentLB.isUserInteractionEnabled = true
        return agreeMentLB
    }()
    
    private var centerAlignment: NSParagraphStyle {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        return paragraphStyle
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(bgView)
        bgView.addSubview(backBtn)
        bgView.addSubview(nameLabel)
        bgView.addSubview(emailT)
        bgView.addSubview(passT)
        bgView.addSubview(countdownButton)
        bgView.addSubview(loginBtn)
//        bgView.addSubview(agreeMentLB)
        
        bgView.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
        backBtn.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 44.pix(), height: 44.pix()))
            make.left.equalTo(bgView)
            make.top.equalTo(bgView).offset(CGFloat(STATUSBAR_HIGH) + 8.pix())
        }
        nameLabel.snp.makeConstraints { make in
            make.centerX.equalTo(bgView)
            make.top.equalTo(backBtn.snp_bottomMargin).offset(18.pix())
            make.size.equalTo(CGSize(width: 200.pix(), height: 30.pix()))
        }
        emailT.snp.makeConstraints { make in
            make.centerX.equalTo(bgView)
            make.top.equalTo(nameLabel.snp_bottomMargin).offset(78.pix())
            make.size.equalTo(CGSize(width: 287.pix(), height: 58.pix()))
        }
        passT.snp.makeConstraints { make in
            make.centerX.equalTo(bgView)
            make.top.equalTo(emailT.snp_bottomMargin).offset(18.pix())
            make.size.equalTo(CGSize(width: 287.pix(), height: 58.pix()))
        }
        countdownButton.snp.makeConstraints { make in
            make.left.equalTo(emailT.snp_leftMargin)
            make.top.equalTo(passT.snp_bottomMargin).offset(14.pix())
            make.size.equalTo(CGSize(width: 400.pix(), height: 20.pix()))
        }
        loginBtn.snp.makeConstraints { make in
            make.centerX.equalTo(bgView)
            make.left.equalTo(emailT.snp_leftMargin)
            make.height.equalTo(48.pix())
            make.top.equalTo(countdownButton.snp_bottomMargin).offset(36.pix())
        }
//        agreeMentLB.snp.makeConstraints { make in
//            make.centerX.equalTo(bgView)
//            make.left.equalTo(emailT.snp_leftMargin)
//            make.top.equalTo(loginBtn.snp_bottomMargin).offset(14.pix())
//            make.height.equalTo(34.pix())
//        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func btnClick(){
        self.block!()
    }
    
    @objc func startCountdown(_ btn: UIButton) {
        self.block1!(btn)
    }
    
    @objc func loginClick(){
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
