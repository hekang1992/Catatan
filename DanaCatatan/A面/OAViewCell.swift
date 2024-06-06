//
//  OAViewCell.swift
//  Catatan
//
//  Created by apple on 2024/3/19.
//

import UIKit
import SwipeCellKit
import Kingfisher

class OAViewCell: SwipeTableViewCell {
    
    var model: IncomesModel! {
        didSet{
            titleLabel1.text = model.addressname
            titleLabel2.text = model.property
            titleLabel3.text = model.chests
            let imageUrl = URL(string: model.effect!)
            iconImageView.kf.setImage(with: imageUrl, placeholder: UIImage(named: "iocn4"))
        }
    }
    
    lazy var bgView: UIView = {
        let bgView = UIView()
        bgView.backgroundColor = .white
        bgView.layer.cornerRadius = 20.pix()
        return bgView
    }()
    
    lazy var iconImageView: UIImageView = {
        let iconImageView = UIImageView()
        iconImageView.image = UIImage(named: "iocn4")
        return iconImageView
    }()
    
    lazy var titleLabel1: UILabel = {
        let titleLabel = UILabel.createLabel(font: UIFont(name: Futura_Bold, size: 16.pix()) ?? UIFont.boldSystemFont(ofSize: 16.pix()), textColor: UIColor("#373D54"), textAlignment: .left)
        titleLabel.text = "Netflix"
        return titleLabel
    }()
    
    lazy var titleLabel2: UILabel = {
        let titleLabel = UILabel.createLabel(font: UIFont(name: Futura_Medium, size: 12.pix()) ?? UIFont.boldSystemFont(ofSize: 12.pix()), textColor: UIColor("#081645"), textAlignment: .left)
        titleLabel.text = "13-12-2024  06:15 pm"
        return titleLabel
    }()
    
    lazy var titleLabel3: UILabel = {
        let titleLabel = UILabel.createLabel(font: UIFont(name: Futura_Bold, size: 16.pix()) ?? UIFont.boldSystemFont(ofSize: 16.pix()), textColor: UIColor("#081645"), textAlignment: .right)
        titleLabel.text = "$1,325.78"
        return titleLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(bgView)
        bgView.addSubview(iconImageView)
        bgView.addSubview(titleLabel1)
        bgView.addSubview(titleLabel2)
        bgView.addSubview(titleLabel3)
        
        bgView.snp.makeConstraints { make in
            make.centerX.equalTo(contentView)
            make.bottom.equalTo(contentView)
            make.left.equalTo(contentView).offset(20.pix())
            make.height.equalTo(80.pix())
        }
        iconImageView.snp.makeConstraints { make in
            make.centerY.equalTo(bgView)
            make.left.equalTo(bgView).offset(15.pix())
            make.size.equalTo(CGSizeMake(50.pix(), 50.pix()))
        }
        titleLabel1.snp.makeConstraints { make in
            make.left.equalTo(iconImageView.snp.right).offset(20.pix())
            make.top.equalTo(bgView).offset(14.pix())
            make.height.equalTo(25.pix())
        }
        titleLabel2.snp.makeConstraints { make in
            make.left.equalTo(iconImageView.snp.right).offset(20.pix())
            make.top.equalTo(titleLabel1.snp.bottom).offset(6.pix())
            make.height.equalTo(25.pix())
        }
        titleLabel3.snp.makeConstraints { make in
            make.right.equalTo(bgView).offset(-20.pix())
            make.top.equalTo(bgView).offset(14.pix())
            make.height.equalTo(25.pix())
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
