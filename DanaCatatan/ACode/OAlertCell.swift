//
//  OAlertCell.swift
//  Catatan
//
//  Created by apple on 2024/3/29.
//

import UIKit

class OAlertCell: UITableViewCell {

    lazy var bgView: UIView = {
        let bgView = UIView()
        bgView.backgroundColor = UIColor("#CEE7FF")
        bgView.layer.cornerRadius = 12.pix()
        return bgView
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
        bgView.addSubview(titleLabel1)
        bgView.addSubview(titleLabel2)
        bgView.addSubview(titleLabel3)
        bgView.snp.makeConstraints { make in
            make.centerX.equalTo(contentView)
            make.bottom.equalTo(contentView)
            make.left.equalTo(contentView).offset(20.pix())
            make.height.equalTo(59.pix())
        }
        titleLabel1.snp.makeConstraints { make in
            make.left.equalTo(bgView).offset(16.pix())
            make.top.equalTo(bgView).offset(14.pix())
            make.height.equalTo(19.pix())
        }
        titleLabel2.snp.makeConstraints { make in
            make.left.equalTo(titleLabel1.snp.left)
            make.top.equalTo(titleLabel1.snp.bottom)
            make.height.equalTo(25.pix())
        }
        titleLabel3.snp.makeConstraints { make in
            make.right.equalTo(bgView).offset(-20.pix())
            make.centerY.equalTo(bgView)
            make.height.equalTo(25.pix())
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    var model: IncomesModel? {
        didSet {
            titleLabel1.text = model?.addressname
            titleLabel2.text = model?.property
            titleLabel3.text = model?.chests
        }
    }
    
    var indexP: Int? {
        didSet {
            if indexP == 1 {
                bgView.backgroundColor = UIColor("#CEE7FF")
            }else if indexP == 2 {
                bgView.backgroundColor = UIColor("#FFE1C0")
            }else if indexP == 3 {
                bgView.backgroundColor = UIColor("#DFF9BE")
            }else {
                bgView.backgroundColor = UIColor("#A4ACC5")
            }
        }
    }
    
}
