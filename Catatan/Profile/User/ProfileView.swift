//
//  ProfileView.swift
//  Catatan
//
//  Created by apple on 2024/3/1.
//

import UIKit

typealias IndexBlock = (_ index: NSInteger,_ title: String) -> Void
class ProfileView: UIView,UITableViewDelegate,UITableViewDataSource {
    
    var blcok: IndexBlock?
    
    let titleArray = ["Dalam Proses Pengajuan","Menunggu Pembayaran Kembali","Sudah Dibayar Kembali","Mengirim email","Keluar Akun","Pembatalan Akun"]
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: CGRect.zero,
                                         style:.grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(tableView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let VinViewCellID = "VinViewCellID"
        let cell = ProfileCell(style: .subtitle, reuseIdentifier: VinViewCellID)
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        cell.nameLable.text = titleArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 72.pix()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 230.pix()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headView = UIView()
        let iconImageView = UIImageView()
        iconImageView.layer.cornerRadius = 40.pix()
        iconImageView.layer.masksToBounds = true
        iconImageView.image = UIImage(named: "iconabc")
        headView.addSubview(iconImageView)
        iconImageView.snp.makeConstraints { make in
            make.centerX.equalTo(headView)
            make.top.equalTo(headView).offset(NAV_HIGH)
            make.size.equalTo(CGSizeMake(80.pix(), 80.pix()))
        }
        let nameLabel = UILabel.createLabel(font: UIFont.systemFont(ofSize: 22.pix(), weight: .semibold), textColor: .black, textAlignment: .center)
        nameLabel.text = "Pengguna"
        headView.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.centerX.equalTo(headView)
            make.top.equalTo(iconImageView.snp.bottom).offset(14.pix())
            make.size.equalTo(CGSizeMake(300.pix(), 15.pix()))
        }
        return headView
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let title = titleArray[indexPath.row]
        self.blcok!(indexPath.row,title)
    }
    
}
