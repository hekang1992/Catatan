//
//  ContractView.swift
//  Catatan
//
//  Created by apple on 2024/2/29.
//

import UIKit
import TYAlertController

class ContractView: UIView,UITableViewDelegate,UITableViewDataSource {
    
    var array: [IncomesModel] = []
    
    var block: (([[String: Any]]) -> Void)?
    
    var block1: ((ContractViewCell) -> Void)?
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero,
                                    style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.showsVerticalScrollIndicator = false
        return tableView
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
        addSubview(tableView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(self).inset(UIEdgeInsets(top: 0, left: 16.pix(), bottom: 0, right: 16.pix()))
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let peopleViewCellID = "peopleViewCellID"
        let cell = ContractViewCell(style: .subtitle, reuseIdentifier: peopleViewCellID)
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        let model = array[indexPath.row]
        cell.model = model
        cell.block1 = { [weak self] in
            guard let modelArray = model.frantic else { return }
            self?.popEView(modelArray,model,cell)
        }
        cell.block2 = { [weak self] in
            self?.block1!(cell)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180.pix()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 180.pix()
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 120.pix()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headView = UIView()
        let iconImageView = UIImageView()
        iconImageView.image = UIImage(named: "bb1")
        headView.addSubview(iconImageView)
        iconImageView.snp.makeConstraints { make in
            make.left.equalTo(headView).offset(11.pix())
            make.top.equalTo(headView).offset(STATUSBAR_HIGH)
            make.size.equalTo(CGSizeMake(130.pix(), 119.pix()))
        }
        let nameLabel = UILabel.createLabel(font: UIFont.systemFont(ofSize: 16.pix(), weight: .semibold), textColor: .black, textAlignment: .left)
        nameLabel.text = "Kontak informasi"
        headView.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.left.equalTo(iconImageView.snp.right).offset(27.pix())
            make.top.equalTo(iconImageView.snp.top).offset(29.pix())
            make.size.equalTo(CGSizeMake(155.pix(), 22.pix()))
        }
        let nameLabel1 = UILabel.createLabel(font: UIFont.systemFont(ofSize: 14.pix(), weight: .regular), textColor: .black, textAlignment: .left)
        nameLabel1.numberOfLines = 0
        nameLabel1.text = "Sekadar untuk kelancaran komunikasi"
        headView.addSubview(nameLabel1)
        nameLabel1.snp.makeConstraints { make in
            make.left.equalTo(iconImageView.snp.right).offset(27.pix())
            make.top.equalTo(nameLabel.snp.bottom).offset(10.pix())
            make.width.equalTo(145.pix())
        }
        return headView
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let headView = UIView()
        if array.count != 0 {
            headView.addSubview(mainBtn2)
            headView.addSubview(nameLabel4)
            mainBtn2.snp.makeConstraints { make in
                make.bottom.equalTo(headView).offset(-2.pix())
                make.centerX.equalTo(headView)
                make.left.equalTo(headView).offset(16.pix())
                make.height.equalTo(56.pix())
            }
            nameLabel4.snp.makeConstraints { make in
                make.centerX.equalTo(headView)
                make.left.equalTo(headView).offset(28.pix())
                make.bottom.equalTo(mainBtn2.snp.top).offset(-10.pix())
                make.height.equalTo(20.pix())
            }
        }
        return headView
    }
    
    func popEView(_ modelArray: [CustomerModel],_ model: IncomesModel, _ cell: ContractViewCell) {
        let exitView = PopEnumView()
        exitView.frame = self.bounds
        exitView.titleStr = model.yearly
        exitView.modelArray = modelArray
        exitView.tableView.reloadData()
        let alertVC = TYAlertController(alert: exitView, preferredStyle: .actionSheet)
        getCurrentUIVC()?.present(alertVC!, animated: true)
        exitView.block = { cell1,title,lives in
            cell.nameLabel4.text = title
            cell.nameLabel4.textColor = .black
            cell.model.saveStr = title
            cell.model.ensued = String(lives)
            cell.model.scuffle = model.scuffle
            getCurrentUIVC()?.dismiss(animated: true)
        }
    }
    
    @objc func sureClick() {
        let array = self.array.map { model in
            var partialResult: [String: Any] = [:]
            partialResult["scuffle"] = model.scuffle
            partialResult["conjured"] = model.conjured
            partialResult["female"] = model.female
            partialResult["ensued"] = model.ensued
            return partialResult
        }
        if let block = block {
            block(array)
        }
    }
}
