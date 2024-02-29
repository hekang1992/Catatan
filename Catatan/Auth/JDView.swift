//
//  JDView.swift
//  Catatan
//
//  Created by apple on 2024/2/29.
//

import UIKit
import JXGradientKit

typealias BackBlock = () -> Void
class JDView: UIView {

    var block:BackBlock?
    
    lazy var bgView: GradientView = {
        let bgView = GradientView()
        let topColer = UIColor("#E4D7EF")
        let minColer = UIColor("#DEE9CF")
        let booColer = UIColor("#E2EFF3")
        bgView.direction = GradientDirection.topToBottom
        bgView.startColor = topColer
        bgView.middleColor = minColer
        bgView.endColor = booColer
        return bgView
    }()
    
    lazy var backBtn: UIButton = {
        let backBtn = UIButton(type: .custom)
        backBtn.setImage(UIImage.init(named: "back"), for: .normal)
        backBtn.addTarget(self, action: #selector(btnClick), for: .touchUpInside)
        return backBtn
    }()
    
    lazy var bgImageView: UIImageView = {
        let bgImageView = UIImageView()
        bgImageView.image = UIImage(named: "adc21")
        bgImageView.contentMode = .scaleAspectFill
        return bgImageView
    }()
    
    lazy var nameLable: UILabel = {
        let nameLable = UILabel.createLabel(font: UIFont.systemFont(ofSize: 18.pix(), weight: .medium), textColor: UIColor.black, textAlignment: .left)
        nameLable.numberOfLines = 0
        nameLable.text = "Informasi Identitas Otentikasi Keamanan"
        return nameLable
    }()
    
    lazy var nameLable1: UILabel = {
        let nameLable = UILabel.createLabel(font: UIFont.systemFont(ofSize: 12.pix(), weight: .regular), textColor: UIColor("#959595"), textAlignment: .left)
        nameLable.numberOfLines = 0
        nameLable.text = "Untuk memastikan keamanan dana Anda, Anda perlu memverifikasi informasi identitas Anda"
        return nameLable
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(bgView)
        bgView.addSubview(backBtn)
        bgView.addSubview(bgImageView)
        bgView.addSubview(nameLable)
        bgView.addSubview(nameLable1)
        
        bgView.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
        backBtn.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 44.pix(), height: 44.pix()))
            make.left.equalTo(bgView)
            make.top.equalTo(bgView).offset(STATUSBAR_HIGH)
        }
        bgImageView.snp.makeConstraints { make in
            make.right.top.equalTo(bgView)
            make.size.equalTo(CGSize(width: 312.pix(), height: 193.pix()))
        }
        nameLable.snp.makeConstraints { make in
            make.left.equalTo(bgView).offset(26.pix())
            make.top.equalTo(bgImageView.snp.bottom).offset(-22.pix())
            make.size.equalTo(CGSize(width: 183.pix(), height: 50.pix()))
        }
        nameLable1.snp.makeConstraints { make in
            make.left.equalTo(bgView).offset(26.pix())
            make.top.equalTo(nameLable.snp.bottom)
            make.size.equalTo(CGSize(width: 292.pix(), height: 34.pix()))
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func btnClick() {
        self.block!()
    }
}
