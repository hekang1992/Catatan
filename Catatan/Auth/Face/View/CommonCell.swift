//
//  CommonCell.swift
//  Catatan
//
//  Created by apple on 2024/3/6.
//

import UIKit

class CommonCell: UITableViewCell {
    
    lazy var bgView: UIView = {
        let bgView = UIView()
        bgView.backgroundColor = .white
        bgView.layer.cornerRadius = 10.pix()
        return bgView
    }()
    
    lazy var nameLable: UILabel = {
        let nameLable = UILabel.createLabel(font: UIFont.systemFont(ofSize: 14, weight: .regular), textColor: .black, textAlignment: .left)
        nameLable.text = "1234abc"
        return nameLable
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(bgView)
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
        bgView.snp.makeConstraints { make in
            make.bottom.equalTo(contentView)
            make.centerX.equalTo(contentView)
            make.left.equalTo(contentView)
            make.height.equalTo(45.pix())
        }
    }
}
