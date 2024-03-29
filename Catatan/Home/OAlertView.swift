//
//  OAlertView.swift
//  Catatan
//
//  Created by apple on 2024/3/29.
//

import UIKit

class OAlertView: UIView, UITableViewDelegate,UITableViewDataSource {
    
    var block: (() -> Void)?
    
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
    
    lazy var bgView: UIView = {
        let bgView = UIView()
        bgView.backgroundColor = .white
        bgView.isUserInteractionEnabled = true
        return bgView
    }()
    
    lazy var btn: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setImage(UIImage(named: "cha-3"), for: .normal)
        btn.addTarget(self, action: #selector(hideClick), for: .touchUpInside)
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(bgView)
        bgView.addSubview(btn)
        bgView.addSubview(tableView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        bgView.snp.makeConstraints { make in
            make.bottom.right.left.equalTo(self)
            make.height.equalTo(550.pix())
        }
        btn.snp.makeConstraints { make in
            make.right.equalTo(bgView).offset(-1.pix())
            make.top.equalTo(bgView).offset(3.pix())
            make.size.equalTo(CGSize(width: 66.pix(), height: 66.pix()))
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
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: vinViewCellID)
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        cell.textLabel?.text = "fadfad"
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.pix()
        
    }
    
}
