//
//  InfoCell.swift
//  Catatan
//
//  Created by apple on 2024/3/7.
//

import UIKit

class InfoCell: UITableViewCell {
    
    var model: CustomerModel? {
        didSet {
            self.nameLabel.text = model?.conjured
        }
    }
    
    lazy var nameLabel: UILabel = {
        let nameLabel = UILabel.createLabel(font: UIFont.systemFont(ofSize: 16.pix(), weight: .regular), textColor: .black, textAlignment: .center)
        nameLabel.layer.cornerRadius = 20.pix()
        nameLabel.layer.masksToBounds = true
        nameLabel.backgroundColor = .white
        return nameLabel
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(nameLabel)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        nameLabel.snp.makeConstraints { make in
            make.centerX.equalTo(contentView)
            make.height.equalTo(50.pix())
            make.top.equalTo(contentView)
            make.left.equalTo(contentView).offset(26.pix())
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
