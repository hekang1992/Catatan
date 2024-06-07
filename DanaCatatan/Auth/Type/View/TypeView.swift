//
//  TypeView.swift
//  Catatan
//
//  Created by apple on 2024/2/29.
//

import UIKit

class TypeView: UIView {

    lazy var nameLable: UILabel = {
        let nameLable = UILabel.createLabel(font: UIFont.systemFont(ofSize: 16.pix(), weight: .medium), textColor: UIColor.black, textAlignment: .left)
        nameLable.text = ""
        return nameLable
    }()
    
    lazy var nameLable1: UILabel = {
        let nameLable = UILabel.createLabel(font: UIFont.systemFont(ofSize: 12.pix(), weight: .regular), textColor: UIColor.black, textAlignment: .left)
        nameLable.text = ""
        return nameLable
    }()

    lazy var bgImageView: UIImageView = {
        let bgImageView = UIImageView()
//        bgImageView.image = UIImage(named: "abc5")
        bgImageView.contentMode = .scaleAspectFill
        return bgImageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(nameLable)
        addSubview(nameLable1)
        addSubview(bgImageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        nameLable.snp.makeConstraints { make in
            make.left.top.equalTo(self)
            make.height.equalTo(22.pix())
        }
        nameLable1.snp.makeConstraints { make in
            make.left.equalTo(self)
            make.bottom.equalTo(self)
            make.size.equalTo(CGSize(width: 240.pix(), height: 22.pix()))
        }
        bgImageView.snp.makeConstraints { make in
            make.top.equalTo(nameLable.snp.top)
            make.left.equalTo(nameLable.snp.right).offset(15.pix())
            make.size.equalTo(CGSize(width: 23, height: 17))
        }
    }
}
