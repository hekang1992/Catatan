//
//  LogFOutView.swift
//  Catatan
//
//  Created by apple on 2024/3/28.
//

import UIKit
import MBProgressHUD_WJExtension

class LogFOutView: UIView {
    
    var block1: (() -> Void)?
    var block2: (() -> Void)?
    
    
    lazy var imageV: UIImageView = {
        let imageV = UIImageView()
        imageV.contentMode = .scaleAspectFit
        imageV.isUserInteractionEnabled = true
        imageV.image = UIImage(named: "logoutfff")
        return imageV
    }()
    
    lazy var label: UILabel = {
        let lable1 = UILabel.createLabel(font: UIFont(name: Futura_Medium, size: 18.pix())!, textColor: .black, textAlignment: .center)
        lable1.numberOfLines = 0
        lable1.text = "This operation will completely delete all account information and cannot be restored! Whether to continue?"
        return lable1
    }()
    
    lazy var btn1: UIButton = {
        let btn = UIButton(type: .custom)
        btn.layer.cornerRadius = 8.pix()
        btn.backgroundColor = UIColor("#DBE4FF")
        btn.setTitle("Cancel", for: .normal)
        btn.titleLabel?.font = UIFont(name: Futura_Bold, size: 16.pix())
        btn.setTitleColor(.white, for: .normal)
        btn.addTarget(self, action: #selector(canCelClick(_:)), for: .touchUpInside)
        return btn
    }()
    
    lazy var btn2: UIButton = {
        let btn = UIButton(type: .custom)
        btn.layer.cornerRadius = 8.pix()
        btn.backgroundColor = UIColor("#DBE4FF")
        btn.setTitle("Confirm", for: .normal)
        btn.titleLabel?.font = UIFont(name: Futura_Bold, size: 16.pix())
        btn.setTitleColor(.white, for: .normal)
        btn.addTarget(self, action: #selector(canCelClick(_:)), for: .touchUpInside)
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imageV)
        imageV.addSubview(label)
        imageV.addSubview(btn1)
        imageV.addSubview(btn2)
        imageV.snp.makeConstraints { make in
            make.center.equalTo(self)
            make.size.equalTo(CGSize(width: 331.pix(), height: 261.pix()))
        }
        label.snp.makeConstraints { make in
            make.centerX.equalTo(imageV)
            make.top.equalTo(imageV).offset(71.pix())
            make.left.equalTo(imageV).offset(41.pix())
        }
        btn1.snp.makeConstraints { make in
            make.bottom.equalTo(imageV).offset(-28.pix())
            make.left.equalTo(imageV).offset(31.pix())
            make.size.equalTo(CGSizeMake(116.pix(), 46.pix()))
        }
        btn2.snp.makeConstraints { make in
            make.bottom.equalTo(imageV).offset(-28.pix())
            make.right.equalTo(imageV).offset(-31.pix())
            make.size.equalTo(CGSizeMake(116.pix(), 46.pix()))
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func canCelClick(_ sender: UIButton) {
        if sender == btn1 {
            btn2.backgroundColor = UIColor("#DBE4FF")
            self.block1!()
        } else if sender == btn2 {
            self.block2!()
            btn1.backgroundColor = UIColor("#DBE4FF")
        }
        sender.backgroundColor = UIColor("#2763FF")
    }
}
