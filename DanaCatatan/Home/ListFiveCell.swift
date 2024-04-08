//
//  ListFiveCell.swift
//  Catatan
//
//  Created by apple on 2024/4/7.
//

import UIKit

class ListFiveCell: UITableViewCell {

    var dict: [String: Any] = [:]

    lazy var label1: UILabel = {
        let label1 = UILabel.createLabel(font: UIFont(name: Futura_Bold, size: 20.pix())!, textColor: .black, textAlignment: .left)
        label1.text = "Last 4 Digits Of The Card"
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
        icon.image = UIImage(named: "fdasfads123")
        return icon
    }()
    
    lazy var emailT: UITextField = {
        let emailT = UITextField()
        emailT.textAlignment = .left
        emailT.textColor = .black
        emailT.keyboardType = .numberPad
        emailT.font = UIFont(name:Futura_Medium , size: 16.pix())
        let placeholderAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont(name:Futura_Medium , size: 16.pix()) ?? UIFont.systemFont(ofSize: 16.pix(), weight: .medium),
            .foregroundColor:UIColor.black.withAlphaComponent(0.29)]
        emailT.attributedPlaceholder = NSAttributedString(string: "Please Enter", attributes: placeholderAttributes)
        return emailT
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(label1)
        contentView.addSubview(bgView)
        bgView.addSubview(icon)
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
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
