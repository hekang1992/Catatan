//
//  SetCellView.swift
//  Catatan
//
//  Created by apple on 2024/3/28.
//

import UIKit

class SetCellView: UIView {
    
    var block: (() -> Void)?

    lazy var bgView: UIView = {
        let bgView = UIView()
        bgView.backgroundColor = .white
        bgView.layer.cornerRadius = 12.pix()
        bgView.isUserInteractionEnabled = true
        return bgView
    }()
    
    lazy var iconImageView: UIImageView = {
        let iconImageView = UIImageView()
        iconImageView.isUserInteractionEnabled = true
        return iconImageView
    }()
    
    lazy var iconImageView1: UIImageView = {
        let iconImageView = UIImageView()
        iconImageView.isUserInteractionEnabled = true
        iconImageView.image = UIImage(named: "jiantouloukong-zuo")
        return iconImageView
    }()
    
    lazy var nameLable: UILabel = {
        let nameLable = UILabel.createLabel(font: UIFont(name: Futura_Bold, size: 16.pix())!, textColor: .black, textAlignment: .left)
        return nameLable
    }()
    
    lazy var btn: UIButton = {
        let btn = UIButton(type: .custom)
        btn.addTarget(self, action: #selector(btnClick), for: .touchUpInside)
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(bgView)
        bgView.addSubview(iconImageView)
        bgView.addSubview(nameLable)
        bgView.addSubview(iconImageView1)
        bgView.addSubview(btn)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        bgView.snp.makeConstraints { make in
            make.bottom.equalTo(self)
            make.centerX.equalTo(self)
            make.left.equalTo(self)
            make.height.equalTo(54.pix())
        }
        iconImageView.snp.makeConstraints { make in
            make.centerY.equalTo(bgView)
            make.left.equalTo(bgView).offset(15.pix())
            make.size.equalTo(CGSizeMake(26.pix(), 26.pix()))
        }
        nameLable.snp.makeConstraints { make in
            make.left.equalTo(iconImageView.snp.right).offset(10.pix())
            make.top.bottom.equalTo(bgView)
            make.right.equalTo(bgView).offset(-40.pix())
        }
        iconImageView1.snp.makeConstraints { make in
            make.centerY.equalTo(bgView)
            make.right.equalTo(bgView).offset(-18.pix())
            make.size.equalTo(CGSize(width: 25.pix(), height: 25.pix()))
        }
        btn.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func btnClick() {
        self.block!()
    }
    
}
