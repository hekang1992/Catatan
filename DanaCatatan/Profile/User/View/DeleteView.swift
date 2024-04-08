//
//  DeleteView.swift
//  Catatan
//
//  Created by apple on 2024/3/1.
//

import UIKit

class DeleteView: UIView {

    var block1: (() -> Void)?
    var block2: (() -> Void)?
    var block3: (() -> Void)?

    lazy var bgView: UIView = {
        let bgView = UIView()
        bgView.backgroundColor = UIColor("#F5F5F5")
        return bgView
    }()
    
    lazy var bgImageView: UIImageView = {
        let bgImageView = UIImageView()
        bgImageView.image = UIImage(named: "abd30")
        return bgImageView
    }()
    
    lazy var nameLable: UILabel = {
        let nameLable = UILabel.createLabel(font: UIFont.systemFont(ofSize: 16.pix(), weight: .semibold), textColor: UIColor.black, textAlignment: .left)
        nameLable.text = "Apa kamu yakin?"
        return nameLable
    }()
    
    lazy var nameLable1: UILabel = {
        let nameLable = UILabel.createLabel(font: UIFont.systemFont(ofSize: 14.pix(), weight: .regular), textColor: UIColor(TITLE_COLOR), textAlignment: .left)
        nameLable.numberOfLines = 0
        let text = "Apakah Anda yakin ingin keluar dari akun Anda? Setelah logout, Anda tidak akan dapat mengakses informasi akun dan data historis Anda.\nJika Anda memutuskan untuk menggunakan aplikasi ini lagi, Anda harus membuat akun baru.Tolong dicatat.\nItem yang dibeli dan keanggotaan tidak dapat dipulihkan.\nData Anda yang tersimpan akan dihapus secara permanen dan tidak dapat dipulihkan."
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 2.pix()
        let attributedText = NSAttributedString(string: text, attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        nameLable.attributedText = attributedText
        return nameLable
    }()
    
    lazy var mainBtn1: UIButton = {
        let button = UIButton(type: .custom)
        button.addTarget(self, action: #selector(cameraClick), for: .touchUpInside)
        button.backgroundColor = UIColor("#BBD598")
        button.layer.cornerRadius = 22.pix()
        button.setTitle("Batal", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16.pix(), weight: .medium)
        return button
    }()
    
    lazy var mainBtn2: UIButton = {
        let button = UIButton(type: .custom)
        button.addTarget(self, action: #selector(photoClick), for: .touchUpInside)
        button.backgroundColor = UIColor("#FFFFFF")
        button.layer.cornerRadius = 22.pix()
        button.setTitle("Konfirmasi", for: .normal)
        button.setTitleColor(.black, for: .normal)
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
        addSubview(bgImageView)
        addSubview(backBtn)
        bgView.addSubview(nameLable)
        bgView.addSubview(nameLable1)
        bgView.addSubview(mainBtn1)
        bgView.addSubview(mainBtn2)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        bgView.snp.makeConstraints { make in
            make.left.right.bottom.equalTo(self)
            make.height.equalTo(435.pix())
        }
        bgImageView.snp.makeConstraints { make in
            make.top.equalTo(bgView).offset(-36.pix())
            make.right.equalTo(bgView).offset(-12.pix())
            make.size.equalTo(CGSize(width: 112.pix(), height: 93.pix()))
        }
        nameLable.snp.makeConstraints { make in
            make.left.equalTo(bgView).offset(13.pix())
            make.top.equalTo(bgView).offset(26.pix())
            make.size.equalTo(CGSizeMake(213.pix(), 37.pix()))
        }
        nameLable1.snp.makeConstraints { make in
            make.left.equalTo(bgView).offset(13.pix())
            make.top.equalTo(nameLable.snp.bottom).offset(12.pix())
            make.width.equalTo(324.pix())
        }
        mainBtn1.snp.makeConstraints { make in
            make.top.equalTo(nameLable1.snp.bottom).offset(28.pix())
            make.centerX.equalTo(bgView)
            make.left.equalTo(bgView).offset(16.pix())
            make.height.equalTo(45.pix())
        }
        mainBtn2.snp.makeConstraints { make in
            make.top.equalTo(mainBtn1.snp.bottom).offset(8.pix())
            make.centerX.equalTo(bgView)
            make.left.equalTo(bgView).offset(16.pix())
            make.height.equalTo(45.pix())
        }
        backBtn.snp.makeConstraints { make in
            make.top.equalTo(self).offset(CGFloat(STATUSBAR_HIGH) + 20.pix())
            make.right.equalTo(bgView).offset(-20.pix())
            make.size.equalTo(CGSize(width: 32.pix(), height: 32.pix()))
        }
        bgView.roundCorners(corners: [.topLeft,.topRight], radius: 20.pix())
    }
    
    @objc func cameraClick() {
        self.block1!()
    }
    
    @objc func photoClick() {
        self.block2!()
    }
    
    @objc func canClick() {
        self.block3!()
    }

}
