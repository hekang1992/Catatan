//
//  PopCityView.swift
//  Catatan
//
//  Created by apple on 2024/3/8.
//

import UIKit
import JXGradientKit

class PopCityView: UIView {

    var block1: (() -> Void)?
    
    lazy var bgView: UIView = {
        let bgView = GradientView()
        let topColer = UIColor("#E4D7EF")
        let minColer = UIColor("#DEE9CF")
        let booColer = UIColor("#E2EFF3")
        bgView.direction = GradientDirection.topToBottom
        bgView.startColor = topColer
        bgView.middleColor = minColer
        bgView.endColor = booColer
        return bgView
    }()
    
    lazy var btn1: UIButton = {
        let btn1 = UIButton(type: .custom)
        btn1.setTitle("Batal", for: .normal)
        btn1.setTitleColor(.black, for: .normal)
        btn1.titleLabel?.font = UIFont.systemFont(ofSize: 16.pix(), weight: .regular)
        btn1.addTarget(self, action: #selector(canClick), for: .touchUpInside)
        return btn1
    }()
    
    lazy var label1: UILabel = {
        let label1 = UILabel.createLabel(font: UIFont.systemFont(ofSize: 20.pix(), weight: .medium), textColor: .black, textAlignment: .center)
        label1.text = "Pilih Alamat"
        return label1
    }()
    
    lazy var btn2: UIButton = {
        let btn2 = UIButton(type: .custom)
        btn2.setTitle("Konfirmasi", for: .normal)
        btn2.setTitleColor(.black, for: .normal)
        btn2.titleLabel?.font = UIFont.systemFont(ofSize: 16.pix(), weight: .regular)
        btn2.addTarget(self, action: #selector(sureClick), for: .touchUpInside)
        return btn2
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(bgView)
        bgView.addSubview(btn1)
        bgView.addSubview(label1)
        bgView.addSubview(btn2)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        bgView.snp.makeConstraints { make in
            make.left.right.bottom.equalTo(self)
            make.height.equalTo(520.pix())
        }
        btn1.snp.makeConstraints { make in
            make.top.equalTo(bgView).offset(30.pix())
            make.left.equalTo(bgView).offset(20.pix())
            make.size.equalTo(CGSize(width: 50.pix(), height: 25.pix()))
        }
        label1.snp.makeConstraints { make in
            make.top.equalTo(bgView).offset(28.pix())
            make.centerX.equalTo(bgView)
            make.size.equalTo(CGSize(width: 120.pix(), height: 28.pix()))
        }
        btn2.snp.makeConstraints { make in
            make.top.equalTo(bgView).offset(30.pix())
            make.right.equalTo(bgView).offset(-20.pix())
            make.size.equalTo(CGSize(width: 100.pix(), height: 25.pix()))
        }
        bgView.roundCorners(corners: [.topLeft,.topRight], radius: 20.pix())
    }
    
    @objc func canClick() {
        self.block1!()
    }
    
    @objc func sureClick() {
        
    }
    
}
