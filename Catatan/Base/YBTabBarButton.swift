//
//  YBTabBarButton.swift
//  Catatan
//
//  Created by apple on 2024/2/27.
//

import UIKit

protocol CustomTabBarButtonDelegate: AnyObject {
    func tabBarIconButtonClick(_ tabBarButton: YBTabBarButton)
}

class YBTabBarButton: UIControl {
    
    lazy var iconBtn: UIButton = {
        let button = UIButton(type: .custom)
        button.contentMode = .center
        button.addTarget(self, action: #selector(iconButtonClick(_:)), for: .touchDown)
        return button
    }()
    
    lazy var titleLbl: UILabel = {
        let titleLbl = UILabel()
        titleLbl.textColor = UIColor("#BBD598")
        titleLbl.font = UIFont.systemFont(ofSize: 19.pix())
        titleLbl.textAlignment = .left
        return titleLbl
    }()
    
    weak var delegate: CustomTabBarButtonDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addSubviews()
    }
    
    private func addSubviews() {
        addSubview(iconBtn)
        addSubview(titleLbl)
        self.layer.cornerRadius = 16.pix()
        iconBtn.translatesAutoresizingMaskIntoConstraints = false
        titleLbl.translatesAutoresizingMaskIntoConstraints = false
        iconBtn.snp.makeConstraints { make in
            make.centerY.equalTo(self)
            make.left.equalTo(self).offset(15.pix())
            make.size.equalTo(CGSize(width: 30.pix(), height: 30.pix()))
        }
        titleLbl.snp.makeConstraints { make in
            make.left.equalTo(iconBtn.snp.right).offset(10.pix())
            make.centerY.equalTo(self)
            make.size.equalTo(CGSize(width: 88.pix(), height: 26.pix()))
        }
    }
    
    @objc private func iconButtonClick(_ sender: UIButton) {
        delegate?.tabBarIconButtonClick(self)
    }
    
    func setTabBarImage(url: String, title: String) {
        titleLbl.text = title
        iconBtn.setImage(UIImage(named: url), for: .normal)
    }
}
