//
//  TypeImageView.swift
//  Catatan
//
//  Created by apple on 2024/2/29.
//

import UIKit

class TypeImageView: UIView {
    
    enum typeImageState {
        case dcan1
        case dcan2
        case dcan3
        case dcan4
    }
    
    var currentState: typeImageState = .dcan1 {
        didSet {
            forCurrentState()
        }
    }
    
    lazy var iconImageView1: UIImageView = {
        let iconImageView = UIImageView()
        iconImageView.contentMode = .scaleAspectFit
        iconImageView.image = UIImage(named: "image_select")
        return iconImageView
    }()
    
    lazy var iconImageView2: UIImageView = {
        let iconImageView = UIImageView()
        iconImageView.contentMode = .scaleAspectFit
        iconImageView.image = UIImage(named: "image_white")
        return iconImageView
    }()
    
    lazy var iconImageView3: UIImageView = {
        let iconImageView = UIImageView()
        iconImageView.contentMode = .scaleAspectFit
        iconImageView.image = UIImage(named: "image_white")
        return iconImageView
    }()
    
    lazy var iconImageView4: UIImageView = {
        let iconImageView = UIImageView()
        iconImageView.contentMode = .scaleAspectFit
        iconImageView.image = UIImage(named: "image_white")
        return iconImageView
    }()
    
    lazy var iconImageView5: UIImageView = {
        let iconImageView = UIImageView()
        iconImageView.image = UIImage(named: "juxing")
        return iconImageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(iconImageView5)
        addSubview(iconImageView1)
        addSubview(iconImageView2)
        addSubview(iconImageView3)
        addSubview(iconImageView4)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        iconImageView5.snp.makeConstraints { make in
            make.centerX.equalTo(self)
            make.size.equalTo(CGSize(width: 8.pix(), height: 301.pix()))
            make.top.equalTo(self).offset(40.pix())
        }
        iconImageView1.snp.makeConstraints { make in
            make.top.equalTo(self)
            make.size.equalTo(CGSize(width: 54.pix(), height: 54.pix()))
            make.centerX.equalTo(self)
        }
        iconImageView2.snp.makeConstraints { make in
            make.top.equalTo(iconImageView1.snp.bottom).offset(53.pix())
            make.size.equalTo(CGSize(width: 54.pix(), height: 54.pix()))
            make.centerX.equalTo(self)
        }
        iconImageView3.snp.makeConstraints { make in
            make.top.equalTo(iconImageView2.snp.bottom).offset(53.pix())
            make.size.equalTo(CGSize(width: 54.pix(), height: 54.pix()))
            make.centerX.equalTo(self)
        }
        iconImageView4.snp.makeConstraints { make in
            make.top.equalTo(iconImageView3.snp.bottom).offset(53.pix())
            make.size.equalTo(CGSize(width: 54.pix(), height: 54.pix()))
            make.centerX.equalTo(self)
        }
    }

    func forCurrentState() {
        switch currentState {
        case .dcan1:
            iconImageView1.image = UIImage(named: "image_select")
            iconImageView2.image = UIImage(named: "image_white")
            iconImageView3.image = UIImage(named: "image_white")
            iconImageView4.image = UIImage(named: "image_white")
            break
        case .dcan2:
            iconImageView1.image = UIImage(named: "image_select")
            iconImageView2.image = UIImage(named: "image_select")
            iconImageView3.image = UIImage(named: "image_white")
            iconImageView4.image = UIImage(named: "image_white")
            break
        case .dcan3:
            iconImageView1.image = UIImage(named: "image_select")
            iconImageView2.image = UIImage(named: "image_select")
            iconImageView3.image = UIImage(named: "image_select")
            iconImageView4.image = UIImage(named: "image_white")
            break
        case .dcan4:
            iconImageView1.image = UIImage(named: "image_select")
            iconImageView2.image = UIImage(named: "image_select")
            iconImageView3.image = UIImage(named: "image_select")
            iconImageView4.image = UIImage(named: "image_select")
            break
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
