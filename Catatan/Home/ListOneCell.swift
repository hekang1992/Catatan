//
//  ListOneCell.swift
//  Catatan
//
//  Created by apple on 2024/3/27.
//

import UIKit

class ListOneCell: UITableViewCell {
    
    var dict: [String: Any] = [:]

    lazy var bgView: UIView = {
        let bgView = UIView()
        bgView.layer.cornerRadius = 16.pix()
        bgView.layer.borderWidth = 1.pix()
        bgView.layer.borderColor = UIColor("#0081FF").cgColor
        return bgView
    }()
    
    lazy var label1: UILabel = {
        let label1 = UILabel.createLabel(font: UIFont(name: Futura_Bold, size: 20.pix())!, textColor: .black, textAlignment: .left)
        label1.text = "Amount"
        return label1
    }()
    
    lazy var lineView: UIView = {
        let lineView = UIView()
        lineView.backgroundColor = UIColor("#0081FF")
        return lineView
    }()
    
    lazy var icon: UIImageView = {
        let icon =  UIImageView()
        icon.image = UIImage(named: "Fund")
        return icon
    }()
    
    lazy var label2: UILabel = {
        let label1 = UILabel.createLabel(font: UIFont(name: Futura_Bold, size: 14.pix())!, textColor: .white, textAlignment: .center)
        label1.text = "Fund"
        label1.layer.cornerRadius = 15.pix()
        label1.layer.masksToBounds = true
        label1.backgroundColor = UIColor("#0081FF")
        return label1
    }()
    
    lazy var emailT: UITextField = {
        let emailT = UITextField()
        emailT.textAlignment = .left
        emailT.textColor = .black
        emailT.keyboardType = UIKeyboardType.numberPad
        emailT.font = UIFont(name:Futura_Medium , size: 16.pix())
        let placeholderAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont(name:Futura_Medium , size: 16.pix()) ?? UIFont.systemFont(ofSize: 16.pix(), weight: .regular),
            .foregroundColor:UIColor.black.withAlphaComponent(0.29)]
//        emailT.attributedPlaceholder = NSAttributedString(string: "Please Enter", attributes: placeholderAttributes)
//        emailT.addTarget(self, action: #selector(textFieldEditingChanged(_:)), for: .editingChanged)
        return emailT
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(bgView)
        bgView.addSubview(label1)
        bgView.addSubview(lineView)
        bgView.addSubview(icon)
        bgView.addSubview(label2)
        bgView.addSubview(emailT)
        bgView.snp.makeConstraints { make in
            make.centerX.equalTo(contentView)
            make.left.equalTo(contentView).offset(26.pix())
            make.top.equalTo(contentView)
            make.height.equalTo(152.pix())
        }
        label1.snp.makeConstraints { make in
            make.top.equalTo(bgView).offset(21.pix())
            make.left.equalTo(bgView).offset(23.pix())
            make.height.equalTo(26.pix())
        }
        lineView.snp.makeConstraints { make in
            make.centerX.equalTo(bgView)
            make.left.equalTo(bgView).offset(22.pix())
            make.height.equalTo(1.pix())
            make.top.equalTo(bgView).offset(90.pix())
        }
        icon.snp.makeConstraints { make in
            make.right.equalTo(bgView).offset(-22.pix())
            make.top.equalTo(bgView).offset(13.pix())
            make.size.equalTo(CGSizeMake(80.pix(), 73.pix()))
        }
        label2.snp.makeConstraints { make in
            make.right.equalTo(icon.snp_rightMargin)
            make.top.equalTo(lineView.snp_bottomMargin).offset(26.pix())
            make.size.equalTo(CGSize(width: 88.pix(), height: 29.pix()))
        }
        emailT.snp.makeConstraints { make in
            make.left.equalTo(bgView).offset(22.pix())
            make.top.equalTo(label1.snp_bottomMargin).offset(18.pix())
            make.size.equalTo(CGSize(width: 200.pix(), height: 28.pix()))
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
