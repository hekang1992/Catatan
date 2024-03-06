//
//  FaceSelectView.swift
//  Catatan
//
//  Created by apple on 2024/3/6.
//

import UIKit

class FaceSelectView: UIView,UITableViewDataSource,UITableViewDelegate {

    var block1: (() -> Void)?
    
    var block2: (() -> Void)?

    lazy var bgView: UIView = {
        let bgView = UIView()
        bgView.backgroundColor = UIColor("#F5F5F5")
        return bgView
    }()
    
    lazy var nameLable: UILabel = {
        let nameLable = UILabel.createLabel(font: UIFont.systemFont(ofSize: 16.pix(), weight: .regular), textColor: UIColor.black, textAlignment: .left)
        nameLable.numberOfLines = 0
        nameLable.text = "Harap konfirmasi informasi identitas Anda.Jika ada kesalahan, mohon diperbaiki."
        return nameLable
    }()
    
    lazy var bgImageView1: UIImageView = {
        let bgImageView = UIImageView()
        bgImageView.image = UIImage(named: "abc7")
        return bgImageView
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
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.showsVerticalScrollIndicator = false
        tableView.estimatedSectionHeaderHeight = 0;
        tableView.estimatedSectionFooterHeight = 0;
        return tableView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(bgView)
        bgView.addSubview(nameLable)
        bgView.addSubview(bgImageView1)
        bgView.addSubview(tableView)
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
            make.height.equalTo(620.pix())
        }
        nameLable.snp.makeConstraints { make in
            make.left.equalTo(bgView).offset(28.pix())
            make.top.equalTo(bgView).offset(20.pix())
            make.right.equalTo(bgView).offset(-28.pix())
            make.height.equalTo(44.pix())
        }
        bgImageView1.snp.makeConstraints { make in
            make.top.equalTo(nameLable.snp.bottom).offset(10.pix())
            make.left.equalTo(bgView).offset(28.pix())
            make.height.equalTo(168.pix())
            make.centerX.equalTo(bgView)
        }
        tableView.snp.makeConstraints { make in
            make.left.equalTo(bgImageView1.snp.left)
            make.top.equalTo(bgImageView1.snp.bottom).offset(14.pix())
            make.centerX.equalTo(bgView)
            make.height.equalTo(240)
        }
        mainBtn1.snp.makeConstraints { make in
            make.top.equalTo(tableView.snp.bottom).offset(43.pix())
            make.centerX.equalTo(bgView)
            make.left.equalTo(bgView).offset(16.pix())
            make.height.equalTo(56.pix())
        }
        backBtn.snp.makeConstraints { make in
            make.top.equalTo(bgView).offset(12.pix())
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

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let commonCellID = "commonCellID"
        let cell = CommonCell(style: .subtitle, reuseIdentifier: commonCellID)
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 82.pix()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.01
    }
}
