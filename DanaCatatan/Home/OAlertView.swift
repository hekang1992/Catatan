//
//  OAlertView.swift
//  Catatan
//
//  Created by apple on 2024/3/29.
//

import UIKit

class OAlertView: UIView, UITableViewDelegate,UITableViewDataSource {
    
    var block: (() -> Void)?
    
    var model: HoveredModel?
    
    var index: Int?
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero,
                                    style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()
    
    lazy var labelS: UILabel = {
        let labelS = UILabel.createLabel(font: UIFont(name: Futura_Bold, size: 20.pix())!, textColor: .black, textAlignment: .left)
        labelS.text = "All Historical Bills"
        return labelS
    }()
    
    lazy var bgView: UIView = {
        let bgView = UIView()
        bgView.backgroundColor = .white
        return bgView
    }()
    
    lazy var btn: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setImage(UIImage(named: "cha3"), for: .normal)
        btn.addTarget(self, action: #selector(hideClick), for: .touchUpInside)
        return btn
    }()
    
//    lazy var iconImage: UIImageView = {
//        let iconImage = UIImageView()
//        iconImage.isUserInteractionEnabled = true
//        iconImage.contentMode = .center
//        iconImage.backgroundColor = .red
//        iconImage.image = UIImage(named: "cha3")
//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideClick))
//        iconImage.addGestureRecognizer(tapGesture)
//        return iconImage
//    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(bgView)
        bgView.addSubview(labelS)
        bgView.addSubview(tableView)
        addSubview(btn)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        bgView.snp.makeConstraints { make in
            make.bottom.right.left.equalTo(self)
            make.height.equalTo(550.pix())
        }
        labelS.snp.makeConstraints { make in
            make.left.equalTo(bgView).offset(18.pix())
            make.top.equalTo(bgView).offset(24.pix())
            make.height.equalTo(22.pix())
        }
        btn.snp.makeConstraints { make in
            make.top.equalTo(labelS.snp.top).offset(-10.pix())
            make.bottom.equalTo(labelS.snp.bottom).offset(10.pix())
            make.right.equalTo(self).offset(-15.pix())
            make.width.equalTo(44.pix())
        }
        tableView.snp.makeConstraints { make in
            make.bottom.right.left.equalTo(bgView)
            make.top.equalTo(btn.snp.bottom)
        }
        bgView.roundCorners(corners: [.topLeft,.topRight], radius: 20.pix())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func hideClick() {
        self.block!()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let vinViewCellID = "VinViewCellID"
        let cell = OAlertCell(style: .subtitle, reuseIdentifier: vinViewCellID)
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        let model = model?.incomes?[indexPath.row]
        cell.model = model
        cell.indexP = index
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model?.incomes?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70.pix()
    }
    
}
