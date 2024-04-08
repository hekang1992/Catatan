//
//  ProfileCell.swift
//  Catatan
//
//  Created by apple on 2024/3/1.
//

import UIKit

class ProfileCell: UITableViewCell {
    
    lazy var bgView: UIView = {
        let bgView = UIView()
        bgView.backgroundColor = .white
        bgView.layer.cornerRadius = 12.pix()
        return bgView
    }()
    
    lazy var iconImageView: UIImageView = {
        let iconImageView = UIImageView()
        iconImageView.image = UIImage(named: "iconabc")
        return iconImageView
    }()
    
    lazy var iconImageView1: UIImageView = {
        let iconImageView = UIImageView()
        iconImageView.image = UIImage(named: "abc17")
        return iconImageView
    }()
    
    lazy var nameLable: UILabel = {
        let nameLable = UILabel.createLabel(font: UIFont.systemFont(ofSize: 16, weight: .regular), textColor: .black, textAlignment: .left)
        nameLable.numberOfLines = 0
        return nameLable
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(bgView)
        bgView.addSubview(iconImageView)
        bgView.addSubview(nameLable)
        bgView.addSubview(iconImageView1)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        bgView.snp.makeConstraints { make in
            make.bottom.equalTo(contentView)
            make.centerX.equalTo(contentView)
            make.left.equalTo(contentView).offset(26.pix())
            make.height.equalTo(60.pix())
        }
        iconImageView.snp.makeConstraints { make in
            make.centerY.equalTo(bgView)
            make.left.equalTo(bgView).offset(12)
            make.size.equalTo(CGSizeMake(26.pix(), 26.pix()))
        }
        nameLable.snp.makeConstraints { make in
            make.left.equalTo(iconImageView.snp.right).offset(10)
            make.top.bottom.equalTo(bgView)
            make.right.equalTo(bgView).offset(-40.pix())
        }
        iconImageView1.snp.makeConstraints { make in
            make.centerY.equalTo(bgView)
            make.right.equalTo(bgView).offset(-18.pix())
            make.size.equalTo(CGSize(width: 7.pix(), height: 11.pix()))
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
