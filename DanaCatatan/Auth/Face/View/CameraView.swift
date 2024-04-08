//
//  CameraView.swift
//  Catatan
//
//  Created by apple on 2024/2/29.
//

import UIKit

class CameraView: UIView {

    var block1: (() -> Void)?
    var block2: (() -> Void)?

    lazy var bgView: UIView = {
        let bgView = UIView()
        bgView.backgroundColor = UIColor("#F5F5F5")
        return bgView
    }()
    
    lazy var bgImageView: UIImageView = {
        let bgImageView = UIImageView()
        bgImageView.image = UIImage(named: "abc27")
        return bgImageView
    }()
    
    lazy var nameLable: UILabel = {
        let nameLable = UILabel.createLabel(font: UIFont.systemFont(ofSize: 16.pix(), weight: .regular), textColor: UIColor.black, textAlignment: .left)
        nameLable.numberOfLines = 0
        nameLable.text = "Silakan unggah foto tanda pengenal yang benar"
        return nameLable
    }()
    
    lazy var bgImageView1: UIImageView = {
        let bgImageView = UIImageView()
        bgImageView.image = UIImage(named: "abc4")
        return bgImageView
    }()
    
    lazy var lineView: UIView = {
        let lineView = UIView()
        lineView.backgroundColor = UIColor("#979797")
        return lineView
    }()
    
    lazy var nameLable1: UILabel = {
        let nameLable = UILabel.createLabel(font: UIFont.systemFont(ofSize: 14.pix(), weight: .semibold), textColor: UIColor(TITLE_COLOR), textAlignment: .center)
        nameLable.numberOfLines = 0
        nameLable.text = "Instruksi foto"
        return nameLable
    }()
    
    lazy var lineView1: UIView = {
        let lineView = UIView()
        lineView.backgroundColor = UIColor("#979797")
        return lineView
    }()
    
    lazy var bgImageView2: UIImageView = {
        let bgImageView = UIImageView()
        bgImageView.image = UIImage(named: "abcd3")
        return bgImageView
    }()
    
    lazy var nameLabel2: UILabel = {
        let nameLabel = UILabel()
        nameLabel.textAlignment = .center
        nameLabel.text = "Perlindungan informasi pribadi"
        nameLabel.textColor = UIColor(TITLE_COLOR)
        nameLabel.font = UIFont.systemFont(ofSize: 14.pix(), weight: .semibold)
        return nameLabel
    }()
    
    lazy var mainBtn1: UIButton = {
        let button = UIButton(type: .custom)
        button.addTarget(self, action: #selector(cameraClick), for: .touchUpInside)
        button.backgroundColor = UIColor("#BBD598")
        button.layer.cornerRadius = 22.pix()
        button.setTitle("Memotret", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16.pix(), weight: .medium)
        return button
    }()
    
    lazy var backBtn: UIButton = {
        let backBtn = UIButton(type: .custom)
        backBtn.setImage(UIImage.init(named: "abc9"), for: .normal)
        backBtn.addTarget(self, action: #selector(canClick), for: .touchUpInside)
        return backBtn
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(bgView)
        bgView.addSubview(bgImageView)
        bgView.addSubview(nameLable)
        bgView.addSubview(bgImageView1)
        bgView.addSubview(lineView)
        bgView.addSubview(nameLable1)
        bgView.addSubview(lineView1)
        bgView.addSubview(bgImageView2)
        bgView.addSubview(nameLabel2)
        bgView.addSubview(mainBtn1)
        bgView.addSubview(backBtn)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        bgView.snp.makeConstraints { make in
            make.left.right.bottom.equalTo(self)
            make.height.equalTo(580.pix())
        }
        bgImageView.snp.makeConstraints { make in
            make.top.equalTo(bgView).offset(31.pix())
            make.left.equalTo(bgView).offset(20.pix())
            make.size.equalTo(CGSize(width: 124.pix(), height: 83.pix()))
        }
        nameLable.snp.makeConstraints { make in
            make.left.equalTo(bgImageView.snp.right).offset(13.pix())
            make.top.equalTo(bgView).offset(59.pix())
            make.right.equalTo(bgView).offset(-21.pix())
            make.height.equalTo(44.pix())
        }
        bgImageView1.snp.makeConstraints { make in
            make.top.equalTo(bgImageView.snp.bottom).offset(13.pix())
            make.left.equalTo(bgView).offset(28.pix())
            make.height.equalTo(168.pix())
            make.centerX.equalTo(bgView)
        }
        lineView.snp.makeConstraints { make in
            make.top.equalTo(bgImageView1.snp_bottomMargin).offset(34.pix())
            make.left.equalTo(bgView).offset(28.pix())
            make.size.equalTo(CGSize(width: 95.pix(), height: 1.pix()))
        }
        lineView1.snp.makeConstraints { make in
            make.top.equalTo(bgImageView1.snp_bottomMargin).offset(34.pix())
            make.right.equalTo(bgView).offset(-28.pix())
            make.size.equalTo(CGSize(width: 95.pix(), height: 1.pix()))
        }
        nameLable1.snp.makeConstraints { make in
            make.top.equalTo(bgImageView1.snp_bottomMargin).offset(24.pix())
            make.centerX.equalTo(bgView)
            make.left.equalTo(bgView)
        }
        bgImageView2.snp.makeConstraints { make in
            make.top.equalTo(nameLable1.snp_bottomMargin).offset(13.pix())
            make.centerX.equalTo(bgView)
            make.left.equalTo(bgView).offset(28.pix())
            make.height.equalTo(74.pix())
        }
        nameLabel2.snp.makeConstraints { make in
            make.centerX.equalTo(bgView)
            make.left.equalTo(bgView).offset(28.pix())
            make.top.equalTo(bgImageView2.snp.bottom).offset(62.pix())
            make.height.equalTo(20.pix())
        }
        mainBtn1.snp.makeConstraints { make in
            make.top.equalTo(nameLabel2.snp.bottom).offset(10.pix())
            make.centerX.equalTo(bgView)
            make.left.equalTo(bgView).offset(16.pix())
            make.height.equalTo(56.pix())
        }
        backBtn.snp.makeConstraints { make in
            make.top.equalTo(bgView).offset(20.pix())
            make.right.equalTo(bgView).offset(-20.pix())
            make.size.equalTo(CGSize(width: 32.pix(), height: 32.pix()))
        }
        bgView.roundCorners(corners: [.topLeft,.topRight], radius: 20.pix())
    }
    
    @objc func cameraClick() {
        self.block1!()
    }
    
    @objc func canClick() {
        self.block2!()
    }
    
}
