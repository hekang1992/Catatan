//
//  CommonCell.swift
//  Catatan
//
//  Created by apple on 2024/3/6.
//

import UIKit

class CommonCell: UITableViewCell {
    
    lazy var leftView: UIView = {
        let leftView = UIView()
        leftView.frame = CGRectMake(0, 0, 20.pix(), 20.pix())
        return leftView
    }()
    
    lazy var textField1: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 10.pix()
        textField.leftView = leftView
        textField.leftViewMode = .always
        return textField
    }()
    
    lazy var nameLable: UILabel = {
        let nameLable = UILabel.createLabel(font: UIFont.systemFont(ofSize: 14, weight: .regular), textColor: .black, textAlignment: .left)
        return nameLable
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(textField1)
        contentView.addSubview(nameLable)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        nameLable.snp.makeConstraints { make in
            make.left.equalTo(contentView)
            make.top.equalTo(contentView).offset(12.pix())
            make.right.equalTo(contentView).offset(-40.pix())
        }
        textField1.snp.makeConstraints { make in
            make.bottom.equalTo(contentView)
            make.centerX.equalTo(contentView)
            make.left.equalTo(contentView)
            make.height.equalTo(45.pix())
        }
    }
}
