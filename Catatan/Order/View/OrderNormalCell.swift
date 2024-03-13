//
//  OrderNormalCell.swift
//  Catatan
//
//  Created by apple on 2024/3/13.
//

import UIKit

class OrderNormalCell: UITableViewCell {

    lazy var bgView: UIView = {
        let bgView = UIView()
        bgView.backgroundColor = .systemBlue
        bgView.layer.cornerRadius = 18.pix()
        return bgView
    }()
    
    lazy var whitView: UIView = {
        let bgView = UIView()
        bgView.backgroundColor = .white
        bgView.layer.cornerRadius = 18.pix()
        return bgView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(bgView)
        contentView.addSubview(whitView)
        
        bgView.snp.makeConstraints { make in
            make.centerX.equalTo(contentView)
            make.left.equalTo(contentView).offset(16.pix())
            make.top.equalTo(contentView)
            make.height.equalTo(144.pix())
        }
        whitView.snp.makeConstraints { make in
            make.centerX.equalTo(contentView)
            make.left.equalTo(contentView).offset(16.pix())
            make.top.equalTo(contentView)
            make.height.equalTo(114.pix())
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
