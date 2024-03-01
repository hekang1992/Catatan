//
//  FaceView.swift
//  Catatan
//
//  Created by apple on 2024/2/29.
//

import UIKit
import JXGradientKit

typealias PhotoBlock = () -> Void
class FaceView: UIView {
    
    var block1: PhotoBlock?
    var block2: PhotoBlock?
    var block3: PhotoBlock?
    
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
    
    lazy var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.textAlignment = .left
        nameLabel.text = "Tanda pengenal"
        nameLabel.textColor = .black
        nameLabel.font = UIFont.systemFont(ofSize: 22.pix(), weight: .semibold)
        return nameLabel
    }()
    
    lazy var nameLabel1: UILabel = {
        let nameLabel = UILabel()
        nameLabel.textAlignment = .center
        nameLabel.text = "Hanya untuk verifikasi identitas"
        nameLabel.textColor = UIColor(TITLE_COLOR)
        nameLabel.font = UIFont.systemFont(ofSize: 12.pix(), weight: .regular)
        return nameLabel
    }()
    
    lazy var nameLabel2: UILabel = {
        let nameLabel = UILabel()
        nameLabel.textAlignment = .left
        nameLabel.text = "KTP"
        nameLabel.textColor = UIColor(TITLE_COLOR)
        nameLabel.font = UIFont.systemFont(ofSize: 16.pix(), weight: .regular)
        return nameLabel
    }()
    
    lazy var iconImageView: UIImageView = {
        let iconImageView = UIImageView()
        iconImageView.image = UIImage(named: "abc6")
        iconImageView.contentMode = .scaleAspectFill
        return iconImageView
    }()
    
    lazy var mainBtn: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "abc3"), for: .normal)
        button.addTarget(self, action: #selector(xiangceClick), for: .touchUpInside)
        return button
    }()
    
    lazy var nameLabel3: UILabel = {
        let nameLabel = UILabel()
        nameLabel.textAlignment = .left
        nameLabel.text = "Pengenalan wajah"
        nameLabel.textColor = UIColor(TITLE_COLOR)
        nameLabel.font = UIFont.systemFont(ofSize: 16.pix(), weight: .regular)
        return nameLabel
    }()
    
    lazy var mainBtn1: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "abc4"), for: .normal)
        button.addTarget(self, action: #selector(xiangjiClick), for: .touchUpInside)
        return button
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
        button.setTitle("Konfirmasi", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16.pix(), weight: .medium)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(scrollView)
        scrollView.addSubview(bgView)
        bgView.addSubview(nameLabel)
        bgView.addSubview(nameLabel1)
        bgView.addSubview(iconImageView)
        bgView.addSubview(nameLabel2)
        bgView.addSubview(mainBtn)
        bgView.addSubview(nameLabel3)
        bgView.addSubview(mainBtn1)
        bgView.addSubview(nameLabel4)
        bgView.addSubview(mainBtn2)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        scrollView.frame = CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT)
        bgView.frame = CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT)
        nameLabel.snp.makeConstraints { make in
            make.left.equalTo(bgView).offset(28.pix())
            make.top.equalTo(bgView).offset(CGFloat(NAV_HIGH) + 23.pix())
            make.size.equalTo(CGSize(width: 168.pix(), height: 30.pix()))
        }
        nameLabel1.snp.makeConstraints { make in
            make.left.equalTo(bgView).offset(28.pix())
            make.top.equalTo(nameLabel.snp.bottom).offset(6.pix())
            make.size.equalTo(CGSize(width: 180.pix(), height: 17.pix()))
        }
        iconImageView.snp.makeConstraints { make in
            make.top.equalTo(bgView).offset(CGFloat(NAV_HIGH) + 11.pix())
            make.size.equalTo(CGSize(width: 150.pix(), height: 105.pix()))
            make.right.equalTo(bgView).offset(-14.pix())
        }
        nameLabel2.snp.makeConstraints { make in
            make.left.equalTo(bgView).offset(28.pix())
            make.top.equalTo(nameLabel1.snp.bottom).offset(20.pix())
            make.size.equalTo(CGSize(width: 64.pix(), height: 22.pix()))
        }
        mainBtn.snp.makeConstraints { make in
            make.top.equalTo(iconImageView.snp.bottom).offset(19.pix())
            make.centerX.equalTo(bgView)
            make.left.equalTo(bgView).offset(28.pix())
            make.height.equalTo(168.pix())
        }
        nameLabel3.snp.makeConstraints { make in
            make.left.equalTo(bgView).offset(28.pix())
            make.top.equalTo(mainBtn.snp.bottom).offset(22.pix())
            make.size.equalTo(CGSize(width: 264.pix(), height: 22.pix()))
        }
        mainBtn1.snp.makeConstraints { make in
            make.top.equalTo(nameLabel3.snp.bottom).offset(13.pix())
            make.centerX.equalTo(bgView)
            make.left.equalTo(bgView).offset(28.pix())
            make.height.equalTo(168.pix())
        }
        nameLabel4.snp.makeConstraints { make in
            make.centerX.equalTo(bgView)
            make.left.equalTo(bgView).offset(28.pix())
            make.top.equalTo(mainBtn1.snp.bottom).offset(68.pix())
            make.height.equalTo(20.pix())
        }
        mainBtn2.snp.makeConstraints { make in
            make.top.equalTo(nameLabel4.snp.bottom).offset(10.pix())
            make.centerX.equalTo(bgView)
            make.left.equalTo(bgView).offset(16.pix())
            make.height.equalTo(56.pix())
        }
        self.mainBtn2.setNeedsLayout()
        self.layoutIfNeeded()
        let maxY = self.mainBtn2.frame.maxY
        self.bgView.frame = CGRectMake(0, 0, SCREEN_WIDTH, maxY + 60.pix())
        self.scrollView.contentSize = CGSize(width: 0, height: maxY + 60.pix())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func xiangceClick() {
        self.block1!()
    }
    
    @objc func xiangjiClick() {
        self.block2!()
    }
    
    @objc func sureClick() {
        self.block3!()
    }

}
