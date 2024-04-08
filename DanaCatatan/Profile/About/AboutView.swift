//
//  AboutView.swift
//  Catatan
//
//  Created by apple on 2024/3/1.
//

import UIKit

class AboutView: UIView {
    
    var block:(() -> Void)?

    lazy var bgView: UIView = {
        let bgView = UIView()
        bgView.backgroundColor = .white
        bgView.layer.cornerRadius = 12.pix()
        return bgView
    }()
    
    lazy var iconImageView: UIImageView = {
        let iconImageView = UIImageView()
        return iconImageView
    }()
    
    lazy var iconImageView1: UIImageView = {
        let iconImageView = UIImageView()
        iconImageView.image = UIImage(named: "iocn1")
        return iconImageView
    }()
    
    lazy var nameLable: UILabel = {
        let nameLable = UILabel.createLabel(font: UIFont.systemFont(ofSize: 16, weight: .semibold), textColor: .black, textAlignment: .left)
        nameLable.numberOfLines = 0
        return nameLable
    }()
    
    lazy var clickBtn: UIButton = {
        let clickBtn = UIButton(type: .custom)
        clickBtn.addTarget(self, action: #selector(btnClick), for: .touchUpInside)
        return clickBtn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(bgView)
        bgView.addSubview(iconImageView)
        bgView.addSubview(nameLable)
        bgView.addSubview(iconImageView1)
        bgView.addSubview(clickBtn)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        bgView.snp.makeConstraints { make in
            make.bottom.equalTo(self)
            make.centerX.equalTo(self)
            make.left.equalTo(self).offset(26.pix())
            make.height.equalTo(89.pix())
        }
        iconImageView.snp.makeConstraints { make in
            make.centerY.equalTo(bgView)
            make.left.equalTo(bgView).offset(20)
            make.size.equalTo(CGSizeMake(38, 38))
        }
        nameLable.snp.makeConstraints { make in
            make.left.equalTo(iconImageView.snp.right).offset(10)
            make.top.bottom.equalTo(bgView)
            make.right.equalTo(bgView).offset(-40.pix())
        }
        iconImageView1.snp.makeConstraints { make in
            make.centerY.equalTo(bgView)
            make.right.equalTo(bgView).offset(-18.pix())
            make.size.equalTo(CGSize(width: 19.pix(), height: 11.pix()))
        }
        clickBtn.snp.makeConstraints { make in
            make.edges.equalTo(bgView)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func btnClick() {
        self.block!()
    }
    
}
