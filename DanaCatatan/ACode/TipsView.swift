//
//  TipsView.swift
//  Catatan
//
//  Created by apple on 2024/3/28.
//

import UIKit

class TipsView: UIView {
    
    var block: (() -> Void)?

    lazy var imageV: UIImageView = {
        let imageV = UIImageView()
        imageV.contentMode = .scaleAspectFit
        imageV.image = UIImage(named: "tipsImage")
        return imageV
    }()
    
    lazy var btn: UIButton = {
        let btn = UIButton(type: .custom)
        btn.addTarget(self, action: #selector(hideClick), for: .touchUpInside)
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imageV)
        addSubview(btn)
        imageV.snp.makeConstraints { make in
            make.center.equalTo(self)
            make.size.equalTo(CGSize(width: 319.pix(), height: 558.pix()))
        }
        btn.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func hideClick() {
        self.block!()
    }
    
}

