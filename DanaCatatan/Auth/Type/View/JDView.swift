//
//  JDView.swift
//  Catatan
//
//  Created by apple on 2024/2/29.
//

import UIKit
import JXGradientKit

typealias BackBlock = () -> Void
typealias NextBlock = () -> Void
class JDView: UIView {

    var block:BackBlock?
    
    var block1:NextBlock?
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.contentInsetAdjustmentBehavior = .never
        scrollView.backgroundColor = UIColor("#FFFFFF")
        return scrollView
    }()
    
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
        let nameLable = UILabel.createLabel(font: UIFont.systemFont(ofSize: 12.pix(), weight: .regular), textColor: UIColor(TITLE_COLOR), textAlignment: .left)
        nameLable.numberOfLines = 0
        nameLable.text = "Untuk memastikan keamanan dana Anda, Anda perlu memverifikasi informasi identitas Anda"
        return nameLable
    }()
    
    lazy var typeView1: TypeView = {
        let typeView1 = TypeView()
        typeView1.nameLable.text = "Informasi dasar"
        typeView1.nameLable1.text = "Hanya untuk verifikasi identitas"
        return typeView1
    }()
    
    lazy var typeView2: TypeView = {
        let typeView1 = TypeView()
        typeView1.nameLable.text = "Informasi Pekerjaan"
        typeView1.nameLable1.text = "Membantu lulus audit dengan cepat"
        return typeView1
    }()
    
    lazy var typeView3: TypeView = {
        let typeView1 = TypeView()
        typeView1.nameLable.text = "Kontak informasi"
        typeView1.nameLable1.text = "Sekadar untuk kelancaran komunikasi"
        return typeView1
    }()
    
    lazy var typeView4: TypeView = {
        let typeView1 = TypeView()
        typeView1.nameLable.text = "Akun bank"
        typeView1.nameLable1.text = "For settlement of collection amount"
        return typeView1
    }()
    
    lazy var nameLabel4: UILabel = {
        let nameLabel = UILabel()
        nameLabel.textAlignment = .center
        nameLabel.text = "Perlindungan informasi pribadi"
        nameLabel.textColor = UIColor(TITLE_COLOR)
        nameLabel.font = UIFont.systemFont(ofSize: 14.pix(), weight: .semibold)
        return nameLabel
    }()
    
    lazy var mainBtn2: UIButton = {
        let button = UIButton(type: .custom)
        button.addTarget(self, action: #selector(sureClick), for: .touchUpInside)
        button.backgroundColor = UIColor("#BBD598")
        button.layer.cornerRadius = 28.pix()
        button.setTitle("Lamar Sekarang", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16.pix(), weight: .medium)
        return button
    }()
    
    lazy var typeImageView: TypeImageView = {
        let typeImageView = TypeImageView()
        return typeImageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(scrollView)
        scrollView.addSubview(bgView)
        bgView.addSubview(backBtn)
        bgView.addSubview(bgImageView)
        bgView.addSubview(nameLable)
        bgView.addSubview(nameLable1)
        bgView.addSubview(typeView1)
        bgView.addSubview(typeView2)
        bgView.addSubview(typeView3)
        bgView.addSubview(typeView4)
        bgView.addSubview(nameLabel4)
        bgView.addSubview(mainBtn2)
        bgView.addSubview(typeImageView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        scrollView.frame = CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT)
        bgView.frame = CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT)
        backBtn.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 44.pix(), height: 44.pix()))
            make.left.equalTo(bgView)
            make.top.equalTo(bgView).offset(CGFloat(STATUSBAR_HIGH) + 8.pix())
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
        typeView1.snp.makeConstraints { make in
            make.left.equalTo(bgView).offset(110.pix())
            make.top.equalTo(nameLable1.snp.bottom).offset(32.pix())
            make.size.equalTo(CGSize(width: 240.pix(), height: 44.pix()))
        }
        typeView2.snp.makeConstraints { make in
            make.left.equalTo(bgView).offset(110.pix())
            make.top.equalTo(typeView1.snp.bottom).offset(66.pix())
            make.size.equalTo(CGSize(width: 240.pix(), height: 44.pix()))
        }
        typeView3.snp.makeConstraints { make in
            make.left.equalTo(bgView).offset(110.pix())
            make.top.equalTo(typeView2.snp.bottom).offset(66.pix())
            make.size.equalTo(CGSize(width: 240.pix(), height: 44.pix()))
        }
        typeView4.snp.makeConstraints { make in
            make.left.equalTo(bgView).offset(110.pix())
            make.top.equalTo(typeView3.snp.bottom).offset(66.pix())
            make.size.equalTo(CGSize(width: 240.pix(), height: 44.pix()))
        }
        nameLabel4.snp.makeConstraints { make in
            make.centerX.equalTo(bgView)
            make.left.equalTo(bgView).offset(28.pix())
            make.top.equalTo(typeView4.snp.bottom).offset(44.pix())
            make.height.equalTo(20.pix())
        }
        mainBtn2.snp.makeConstraints { make in
            make.top.equalTo(nameLabel4.snp.bottom).offset(10.pix())
            make.centerX.equalTo(bgView)
            make.left.equalTo(bgView).offset(16.pix())
            make.height.equalTo(56.pix())
        }
        typeImageView.snp.makeConstraints { make in
            make.top.equalTo(nameLable1.snp.bottom).offset(27.pix())
            make.size.equalTo(CGSize(width: 54.pix(), height: 360.pix()))
            make.left.equalTo(bgView).offset(25.pix())
        }
        self.mainBtn2.setNeedsLayout()
        self.layoutIfNeeded()
        let maxY = self.mainBtn2.frame.maxY
        self.bgView.frame = CGRectMake(0, 0, SCREEN_WIDTH, maxY + 20.pix())
        self.scrollView.contentSize = CGSize(width: 0, height: maxY + 20.pix())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func btnClick() {
        self.block!()
    }
    
    @objc func sureClick() {
        self.block1!()
    }
    
}
