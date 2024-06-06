//
//  TimeAlertCell.swift
//  Catatan
//
//  Created by apple on 2024/4/7.
//

import UIKit

class TimeAlertCell: UITableViewCell {

    lazy var lable: UILabel = {
        let label = UILabel.createLabel(font: UIFont(name: Futura_Bold, size: 20.pix())!, textColor: .black, textAlignment: .center)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(lable)
        lable.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
