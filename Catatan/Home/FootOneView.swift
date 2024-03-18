//
//  FootOneView.swift
//  Catatan
//
//  Created by apple on 2024/3/18.
//

import UIKit

class FootOneView: UIView {

    lazy var lineView: UIView = {
        let lineView = UIView()
        lineView.backgroundColor = .white
        lineView.layer.cornerRadius = 2.pix()
        return lineView
    }()
    
    lazy var iconImageView: UIImageView = {
        let iconImageView = UIImageView()
        iconImageView.image = UIImage(named: "dfa124f")
        return iconImageView
    }()
    
    lazy var label1: UILabel = {
        let label1 = UILabel.createLabel(font: UIFont.systemFont(ofSize: 16.pix(), weight: .medium), textColor: .white, textAlignment: .center)
        label1.numberOfLines = 0
        return label1
    }()
    
    lazy var label2: UILabel = {
        let label1 = UILabel.createLabel(font: UIFont.systemFont(ofSize: 16.pix(), weight: .medium), textColor: .white, textAlignment: .center)
        label1.numberOfLines = 0
        return label1
    }()
    
    lazy var label3: UILabel = {
        let label1 = UILabel.createLabel(font: UIFont.systemFont(ofSize: 16.pix(), weight: .semibold), textColor: .white, textAlignment: .center)
        return label1
    }()
    
    lazy var label4: UILabel = {
        let label1 = UILabel.createLabel(font: UIFont.systemFont(ofSize: 16.pix(), weight: .semibold), textColor: .white, textAlignment: .center)
        return label1
    }()
    
    lazy var label5: UILabel = {
        let label1 = UILabel.createLabel(font: UIFont.systemFont(ofSize: 26.pix(), weight: .regular), textColor: .black, textAlignment: .center)
        label1.text = "80%"
        return label1
    }()
    
    lazy var label6: UILabel = {
        let label1 = UILabel.createLabel(font: UIFont.systemFont(ofSize: 12.pix(), weight: .regular), textColor: .black, textAlignment: .center)
        label1.numberOfLines = 0
        label1.text = "80% dari orang dapat!\nmemperoleh pinjaman ini."
        return label1
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(lineView)
        addSubview(iconImageView)
        addSubview(label1)
        addSubview(label2)
        addSubview(label3)
        addSubview(label4)
        addSubview(label5)
        addSubview(label6)
        lineView.snp.makeConstraints { make in
            make.centerX.equalTo(self)
            make.top.equalTo(self).offset(8.pix())
            make.size.equalTo(CGSize(width: 44.pix(), height: 4.pix()))
        }
        iconImageView.snp.makeConstraints { make in
            make.centerX.equalTo(self)
            make.size.equalTo(CGSize(width: 276.pix(), height: 135.pix()))
            make.top.equalTo(lineView.snp.bottom).offset(20.pix())
        }
        label1.snp.makeConstraints { make in
            make.top.equalTo(iconImageView.snp.bottom).offset(23.pix())
            make.left.equalTo(self).offset(3.pix())
            make.width.equalTo(114.pix())
        }
        label2.snp.makeConstraints { make in
            make.top.equalTo(iconImageView.snp.bottom).offset(23.pix())
            make.right.equalTo(self).offset(-3.pix())
            make.width.equalTo(114.pix())
        }
        label3.snp.makeConstraints { make in
            make.top.equalTo(label1.snp.bottom).offset(6.pix())
            make.left.equalTo(self).offset(3.pix())
            make.width.equalTo(114.pix())
        }
        label4.snp.makeConstraints { make in
            make.top.equalTo(label2.snp.bottom).offset(11.pix())
            make.right.equalTo(self).offset(-3.pix())
            make.width.equalTo(114.pix())
        }
        label5.snp.makeConstraints { make in
            make.centerX.equalTo(self)
            make.top.equalTo(iconImageView.snp.top).offset(59.pix())
            make.width.equalTo(100.pix())
        }
        label6.snp.makeConstraints { make in
            make.centerX.equalTo(self)
            make.top.equalTo(label5.snp.bottom).offset(6.pix())
            make.width.equalTo(200.pix())
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
