//
//  FuDaiView.swift
//  DanaCatatan
//
//  Created by apple on 2024/4/9.
//

import UIKit

class FuDaiView: UIView {

    lazy var gbView: UIView = {
        let gbView = UIView()
        gbView.backgroundColor = .white
        gbView.layer.cornerRadius = 12.pix()
        return gbView
    }()
    
    lazy var label: UILabel = {
        let label = UILabel.createLabel(font: UIFont.systemFont(ofSize: 12.pix(), weight: .regular), textColor: UIColor("#000000"), textAlignment: .left)
        label.numberOfLines = 0
        label.text = "Pengguna tersayang, tolong\nselesaikan pembayaran sebelum\ntanggal untuk menghindari mengalami biaya tambahan."
        return label
    }()
    
    lazy var label1: UILabel = {
        let label1 = UILabel.createLabel(font: UIFont.systemFont(ofSize: 12.pix(), weight: .regular), textColor: UIColor("#000000"), textAlignment: .center)
        label1.layer.cornerRadius = 7.pix()
        label1.layer.masksToBounds = true
        label1.text = "Pembayaran"
        label1.backgroundColor = UIColor("#BBD598")
        return label1
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(gbView)
        gbView.addSubview(label)
        gbView.addSubview(label1)
        gbView.snp.makeConstraints { make in
            make.center.equalTo(self)
            make.left.equalTo(self).offset(16.pix())
            make.height.equalTo(80.pix())
        }
        label.snp.makeConstraints { make in
            make.left.equalTo(gbView).offset(17.pix())
            make.center.equalTo(gbView)
        }
        label1.snp.makeConstraints { make in
            make.top.equalTo(gbView).offset(15.pix())
            make.right.equalTo(gbView).offset(-17.pix())
            make.size.equalTo(CGSizeMake(94.pix(), 28.pix()))
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
