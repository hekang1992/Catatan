//
//  ListThreeCell.swift
//  Catatan
//
//  Created by apple on 2024/3/27.
//

import UIKit
import MBProgressHUD_WJExtension
import TYAlertController

class ListThreeCell: UITableViewCell {
    
    var dict: [String: Any] = [:]
    
    lazy var label1: UILabel = {
        let label1 = UILabel.createLabel(font: UIFont(name: Futura_Bold, size: 20.pix())!, textColor: .black, textAlignment: .left)
        label1.text = "Accounting Reminder"
        return label1
    }()
    
    lazy var bgView: UIView = {
        let bgView = UIView()
        bgView.layer.cornerRadius = 16.pix()
        bgView.layer.borderWidth = 1.pix()
        bgView.layer.borderColor = UIColor("#0081FF").cgColor
        return bgView
    }()
    
    lazy var icon: UIImageView = {
        let icon =  UIImageView()
        icon.image = UIImage(named: "435rtef")
        return icon
    }()
    
    lazy var icon1: UIImageView = {
        let icon =  UIImageView()
        icon.image = UIImage(named: "threedfaf")
        return icon
    }()
    
    lazy var emailT: UITextField = {
        let emailT = UITextField()
        emailT.textAlignment = .left
        emailT.textColor = .black
        emailT.keyboardType = UIKeyboardType.default
        emailT.font = UIFont(name:Futura_Medium , size: 16.pix())
        let placeholderAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont(name:Futura_Medium , size: 16.pix()) ?? UIFont.systemFont(ofSize: 16.pix(), weight: .medium),
            .foregroundColor:UIColor.black.withAlphaComponent(0.29)]
        emailT.attributedPlaceholder = NSAttributedString(string: "Please choose", attributes: placeholderAttributes)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(textFieldTapped(_ :)))
        emailT.addGestureRecognizer(tapGesture)
        return emailT
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(label1)
        contentView.addSubview(bgView)
        bgView.addSubview(icon)
        bgView.addSubview(icon1)
        bgView.addSubview(emailT)
        label1.snp.makeConstraints { make in
            make.left.equalTo(contentView).offset(26.pix())
            make.top.equalTo(contentView).offset(16.pix())
            make.height.equalTo(24.pix())
        }
        bgView.snp.makeConstraints { make in
            make.left.equalTo(contentView).offset(26.pix())
            make.top.equalTo(label1.snp.bottom).offset(12.pix())
            make.centerX.equalTo(contentView)
            make.height.equalTo(52.pix())
        }
        icon.snp.makeConstraints { make in
            make.centerY.equalTo(bgView)
            make.left.equalTo(bgView).offset(11.pix())
            make.size.equalTo(CGSize(width: 32.pix(), height: 32.pix()))
        }
        emailT.snp.makeConstraints { make in
            make.left.equalTo(icon.snp_rightMargin).offset(15.pix())
            make.right.equalTo(bgView)
            make.top.bottom.equalTo(bgView)
        }
        icon1.snp.makeConstraints { make in
            make.centerY.equalTo(bgView)
            make.right.equalTo(bgView).offset(-18.pix())
            make.size.equalTo(CGSize(width: 15.pix(), height: 7.pix()))
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func textFieldTapped(_ sender: UITapGestureRecognizer) {
        guard let textField = sender.view as? UITextField else { return }
        let timeView = TimeAlertView()
        timeView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 500.pix());
        let alertVC = TYAlertController(alert: timeView, preferredStyle: .actionSheet)
        let vc = DanaCatatan.viewController(for: textField)
        vc?.present(alertVC!, animated: true)
        timeView.block = { string in
            vc?.dismiss(animated: true, completion: {
                textField.text = string
            })
        }
    }
}
