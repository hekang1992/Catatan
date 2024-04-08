//
//  FNodataView.swift
//  Catatan
//
//  Created by apple on 2024/3/28.
//

import UIKit

class FNodataView: UIView {
    
    lazy var bgView: UIView = {
        let bgView = UIView()
        bgView.backgroundColor = UIColor("#F4F8EE")
        return bgView
    }()

    lazy var icon: UIImageView = {
        let icon = UIImageView()
        icon.contentMode = .scaleAspectFit
        icon.image = UIImage(named: "nonodata1")
        return icon
    }()
    
    lazy var label: UILabel = {
        let label = UILabel.createLabel(font: UIFont(name: Futura_Medium, size: 16.pix())!, textColor: UIColor("#C9C9C9"), textAlignment: .center)
        label.text = "There is currently no bill"
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(bgView)
        bgView.addSubview(icon)
        bgView.addSubview(label)
        bgView.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
        icon.snp.makeConstraints { make in
            make.centerX.equalTo(bgView)
            make.top.equalTo(bgView).offset(107.pix())
            make.size.equalTo(CGSizeMake(137.pix(), 117.pix()))
        }
        label.snp.makeConstraints { make in
            make.centerX.equalTo(bgView)
            make.top.equalTo(icon.snp.bottom).offset(12.pix())
            make.height.equalTo(22.pix())
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
