//
//  HomeOneCell.swift
//  Catatan
//
//  Created by apple on 2024/3/15.
//

import UIKit

class HomeOneCell: UITableViewCell {
    
    var block: (() -> Void)?
    
    lazy var label1: UILabel = {
        let label = UILabel.createLabel(font: UIFont.systemFont(ofSize: 18.pix(), weight: .semibold), textColor: .black, textAlignment: .center)
        return label
    }()
    
    lazy var label2: UILabel = {
        let label = UILabel.createLabel(font: UIFont.systemFont(ofSize: 40.pix(), weight: .black), textColor: .black, textAlignment: .center)
        return label
    }()

    lazy var btn: UIButton = {
        let btn = UIButton(type: .custom)
        btn.backgroundColor = UIColor.black
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 26.pix(), weight: .black)
        btn.setTitle("Lamar Sekarang", for: .normal)
        btn.layer.cornerRadius = 12.pix()
        btn.addTarget(self, action: #selector(applyClick), for: .touchUpInside)
        return btn
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(label1)
        contentView.addSubview(label2)
        contentView.addSubview(btn)
        label1.snp.makeConstraints { make in
            make.left.equalTo(16.pix())
            make.centerX.equalTo(contentView)
            make.top.equalTo(contentView).offset(18.pix())
            make.height.equalTo(28.pix())
        }
        label2.snp.makeConstraints { make in
            make.left.equalTo(label1.snp_leftMargin)
            make.centerX.equalTo(contentView)
            make.top.equalTo(label1.snp_bottomMargin).offset(4.pix())
            make.height.equalTo(73.pix())
        }
        btn.snp.makeConstraints { make in
            make.left.equalTo(label1.snp_leftMargin)
            make.centerX.equalTo(contentView)
            make.top.equalTo(label2.snp_bottomMargin).offset(17.pix())
            make.height.equalTo(73.pix())
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func applyClick() {
        self.block?()
    }
    
    var model: DrawingModel! {
        didSet {
            label1.text = model.given
            label2.text = model.dreary
            btn.setTitle(model.managers, for: .normal)
        }
    }
}
