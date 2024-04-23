//
//  BankListView.swift
//  Catatan
//
//  Created by apple on 2024/3/22.
//

import UIKit

class BankListView: UIView {
    
    var block1: (() -> Void)?
    var block2: (() -> Void)?
    var block3: (() -> Void)?
    var block4: (() -> Void)?
    var block5: (() -> Void)?
    lazy var grayView: UIView = {
        let grayView = UIView()
        grayView.backgroundColor = .black.withAlphaComponent(0.3)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        grayView.isUserInteractionEnabled = true
        grayView.addGestureRecognizer(tapGesture)
        return grayView
    }()
    
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
    
    lazy var btn1: UIButton = {
        let btn1 = UIButton(type: .custom)
        btn1.tag = 101
        btn1.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        return btn1
    }()
    
    lazy var btn2: UIButton = {
        let btn1 = UIButton(type: .custom)
        btn1.tag = 102
        btn1.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        return btn1
    }()
    
    lazy var btn3: UIButton = {
        let btn1 = UIButton(type: .custom)
        btn1.tag = 103
        btn1.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        return btn1
    }()
    
    lazy var btn4: UIButton = {
        let btn1 = UIButton(type: .custom)
        btn1.tag = 104
        btn1.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        return btn1
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(grayView)
        addSubview(iconImageViwe1)
        addSubview(iconImageViwe2)
        addSubview(bgView)
        bgView.addSubview(btn1)
        bgView.addSubview(btn2)
        bgView.addSubview(btn3)
        bgView.addSubview(btn4)
        grayView.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
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
        btn1.snp.makeConstraints { make in
            make.top.equalTo(bgView).offset(42.pix())
            make.left.equalTo(bgView).offset(39.pix())
            make.size.equalTo(CGSizeMake(105.pix(), 96.pix()))
        }
        btn2.snp.makeConstraints { make in
            make.top.equalTo(bgView).offset(42.pix())
            make.right.equalTo(bgView).offset(-39.pix())
            make.size.equalTo(CGSizeMake(105.pix(), 96.pix()))
        }
        btn3.snp.makeConstraints { make in
            make.bottom.equalTo(bgView).offset(-40.pix())
            make.left.equalTo(bgView).offset(39.pix())
            make.size.equalTo(CGSizeMake(105.pix(), 96.pix()))
        }
        btn4.snp.makeConstraints { make in
            make.bottom.equalTo(bgView).offset(-40.pix())
            make.right.equalTo(bgView).offset(-39.pix())
            make.size.equalTo(CGSizeMake(105.pix(), 96.pix()))
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func buttonTapped(_ sender: UIButton) {
        // Handle button tap
        print("Button tapped")
        switch sender.tag {
        case 101:
            self.block1!()
            break
        case 102:
            self.block2!()
            break
        case 103:
            self.block3!()
            break
        case 104:
            self.block4!()
            break
        default:
            break
        }
    }
    
}

extension BankListView {
    @objc func viewTapped() {
        self.block5?()
    }
}
