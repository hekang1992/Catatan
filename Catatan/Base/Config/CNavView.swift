//
//  CNavView.swift
//  Catatan
//
//  Created by apple on 2024/2/29.
//

import UIKit

class CNavView: UIView {
    
    var block: (() -> Void)?
    
    lazy var bgView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.clear
        return view
    }()
    
    lazy var backBtn: UIButton = {
        let backBtn = UIButton(type: .custom)
        backBtn.setImage(UIImage.init(named: "back"), for: .normal)
        backBtn.addTarget(self, action: #selector(backClick), for: .touchUpInside)
        return backBtn
    }()
    
    lazy var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.textAlignment = .left
        nameLabel.text = ""
        nameLabel.textColor = .black
        nameLabel.font = UIFont.systemFont(ofSize: 16.pix(), weight: .semibold)
        return nameLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    private func setupUI() {
        addSubview(bgView)
        bgView.addSubview(backBtn)
        bgView.addSubview(nameLabel)
        
        bgView.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
        
        backBtn.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 50.pix(), height: 50.pix()))
            make.left.bottom.equalTo(bgView)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.centerX.equalTo(bgView)
            make.top.equalTo(backBtn.snp.top).offset(12.pix())
            make.height.equalTo(22.pix())
        }
    }
    
    @objc func backClick() {
        block?()
    }
    
}
