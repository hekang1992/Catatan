//
//  PersonalView.swift
//  Catatan
//
//  Created by apple on 2024/2/29.
//

import UIKit
import TYAlertController

typealias IndexPBlock = (_ index: NSInteger) -> Void
class PersonalView: UIView,UITableViewDelegate,UITableViewDataSource {
    
    var blcok: IndexPBlock?
    
    var array: [CravedModel] = []
    
    var cityArray: [IncomesModel] = []
    
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
        let cell = CommonCell(style: .subtitle, reuseIdentifier: peopleViewCellID)
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        cell.model = array[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85.pix()
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
        iconImageView.image = UIImage(named: "abcd123")
        headView.addSubview(iconImageView)
        iconImageView.snp.makeConstraints { make in
            make.right.equalTo(headView).offset(-11.pix())
            make.top.equalTo(headView).offset(STATUSBAR_HIGH)
            make.size.equalTo(CGSizeMake(162.pix(), 115.pix()))
        }
        let nameLabel = UILabel.createLabel(font: UIFont.systemFont(ofSize: 16.pix(), weight: .semibold), textColor: .black, textAlignment: .left)
        nameLabel.text = "Informasi Pekerjaan"
        headView.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.left.equalTo(headView).offset(15.pix())
            make.top.equalTo(iconImageView.snp.top).offset(29.pix())
            make.size.equalTo(CGSizeMake(155.pix(), 22.pix()))
        }
        let nameLabel1 = UILabel.createLabel(font: UIFont.systemFont(ofSize: 14.pix(), weight: .regular), textColor: .black, textAlignment: .left)
        nameLabel1.numberOfLines = 0
        nameLabel1.text = "Membantu lulus audit dengan cepat"
        headView.addSubview(nameLabel1)
        nameLabel1.snp.makeConstraints { make in
            make.left.equalTo(headView).offset(15.pix())
            make.top.equalTo(nameLabel.snp.bottom).offset(7.pix())
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model: CravedModel = array[indexPath.row]
        let brick = model.brick
        let cell = tableView.cellForRow(at: indexPath) as? CommonCell
        if brick == "rty" {//枚举
            guard let modelArray = model.customers else { return }
            self.popEView(modelArray,model,cell!)
        }else if brick == "vry" {//城市选择
            self.popCityView(cityArray,cell!,model)
        }
    }
    
    func popEView(_ modelArray: [CustomerModel],_ model: CravedModel, _ cell: CommonCell) {
        let exitView = PopEnumView()
        exitView.frame = self.bounds
        exitView.titleStr = model.waiters
        exitView.modelArray = modelArray
        exitView.tableView.reloadData()
        let alertVC = TYAlertController(alert: exitView, preferredStyle: .actionSheet)
        getCurrentUIVC()?.present(alertVC!, animated: true)
        exitView.block = { cell1,title,lives in
            cell.textField1.text = title
            cell.model.prime = title
            let dict = [model.awareness:lives]
            if let jsonData = try? JSONSerialization.data(withJSONObject: dict, options: []) {
                if let jsonString = String(data: jsonData, encoding: .utf8) {
                    print("enmu>>>>>>>>>>\(jsonString)")
                    cell.model.saveStr = jsonString
                    cell.textField2.text = cell.model.saveStr
                }
            }
            getCurrentUIVC()?.dismiss(animated: true)
        }
    }
    
    func popCityView(_ array: [IncomesModel], _ cell: CommonCell, _ model: CravedModel) {
        let exitView = PopCityView()
        exitView.frame = self.bounds
        exitView.array = array
        let alertVC = TYAlertController(alert: exitView, preferredStyle: .actionSheet)
        getCurrentUIVC()?.present(alertVC!, animated: true)
        exitView.block1 = {
            getCurrentUIVC()?.dismiss(animated: true)
        }
        exitView.block2 = { cityStr in
            getCurrentUIVC()?.dismiss(animated: true,completion: {
                cell.textField1.text = cityStr
                cell.model.prime = cityStr
                let dict = [model.awareness:cityStr]
                if let jsonData = try? JSONSerialization.data(withJSONObject: dict, options: []) {
                    if let jsonString = String(data: jsonData, encoding: .utf8) {
                        print("city>>>>>>\(jsonString)")
                        cell.model.saveStr = jsonString
                        cell.textField2.text = cell.model.saveStr
                    }
                }
            })
        }
    }
    
    @objc func sureClick() {
        for view in self.subviews {
            if view.isKind(of: UITableView.self)  {
                for cell in tableView.subviews {
                    if cell.isKind(of: CommonCell.self) {
                        if let cell = cell as? CommonCell {
                            print("str====\(cell.textField1.text ?? "")")
                            let jsonStr = cell.textField2.text
                            if let jsonData = jsonStr?.data(using: .utf8),
                               let dict = try? JSONSerialization.jsonObject(with: jsonData, options: []) as? [String: Any] {
//                                print("dict>>>>\(dict)")
                            } else {
//                                print("无法将字符串转换为字典")
                            }
                        }
                    }
                }
            }
        }
    }
}


