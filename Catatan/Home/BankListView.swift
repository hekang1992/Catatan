//
//  BankListView.swift
//  Catatan
//
//  Created by apple on 2024/3/22.
//

import UIKit

class BankListView: UIView {

    lazy var iconImageViwe1: UIImageView = {
        let iconImageViwe = UIImageView()
        iconImageViwe.image = UIImage(named: "ins1")
        return iconImageViwe
    }()

    lazy var iconImageViwe2: UIImageView = {
        let iconImageViwe = UIImageView()
        iconImageViwe.image = UIImage(named: "ins2")
        return iconImageViwe
    }()
    
    lazy var bgView: UIView = {
        let bgView = UIView()
        bgView.backgroundColor = .white
        bgView.layer.cornerRadius = 30.pix()
        return bgView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(iconImageViwe1)
        addSubview(iconImageViwe2)
        addSubview(bgView)
        
        iconImageViwe1.snp.makeConstraints { make in
            make.centerX.equalTo(self)
            make.top.equalTo(self).offset(210.pix())
            make.size.equalTo(CGSizeMake(204.pix(), 50.pix()))
        }
        bgView.snp.makeConstraints { make in
            make.top.equalTo(iconImageViwe1.snp_bottomMargin)
            make.left.equalTo(self).offset(20.pix())
            make.centerX.equalTo(self)
            make.height.equalTo(295.pix())
        }
        iconImageViwe2.snp.makeConstraints { make in
            make.centerX.equalTo(self)
            make.top.equalTo(bgView.snp_bottomMargin).offset(-40.pix())
            make.size.equalTo(CGSizeMake(204.pix(), 97.pix()))
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
