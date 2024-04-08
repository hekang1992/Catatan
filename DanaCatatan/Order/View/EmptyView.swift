//
//  EmptyView.swift
//  Catatan
//
//  Created by apple on 2024/3/13.
//

import UIKit

class EmptyView: UIView {

    lazy var iconImageView: UIImageView = {
        let iconImageView = UIImageView()
        iconImageView.image = UIImage(named: "vgg12")
        return iconImageView
    }()
    
    lazy var label1: UILabel = {
        let label1 = UILabel.createLabel(font: UIFont.systemFont(ofSize: 16.pix(), weight: .medium), textColor: UIColor(TITLE_COLOR), textAlignment: .center)
        label1.text = "Tidak Ada Catatan"
        return label1
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(iconImageView)
        addSubview(label1)
        iconImageView.snp.makeConstraints { make in
            make.center.equalTo(self).inset(UIEdgeInsets(top: 0, left: 0, bottom: 100.pix(), right: 0))
            make.size.equalTo(CGSize(width: 178.pix(), height: 111.pix()))
        }
        label1.snp.makeConstraints { make in
            make.centerX.equalTo(self)
            make.top.equalTo(iconImageView.snp.bottom).offset(46.pix())
            make.height.equalTo(22.pix())
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
