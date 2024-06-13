//
//  ListView.swift
//  Catatan
//
//  Created by apple on 2024/3/27.
//

import UIKit
import MBProgressHUD_WJExtension

class ListView: UIView,UITableViewDelegate,UITableViewDataSource {
    
    var dictBlock: (([String: Any]) -> Void)?
    
    var dict: [String: Any] = [:]
    
    enum typeImageState {
        case fund1
        case card1
        case card2
        case cash1
        case cash2
        case car1
    }
    
    var model: IncomesModel?
    
    var typeStr: String?
    
    var currentState: typeImageState?
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero,
                                    style: .grouped)
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
        addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index: Int = indexPath.row
        if currentState == .fund1{
            if index == 0 {
                let cellIdentifier = "\(typeStr ?? "")_cell0"
                var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? ListOneCell
                if cell == nil {
                    cell = ListOneCell(style: .subtitle, reuseIdentifier: cellIdentifier)
                    cell?.backgroundColor = .clear
                    cell?.selectionStyle = .none
                    if let str = typeStr {
                        if str.contains("Other") {
                            cell?.label2.text = "Other"
                        }else{
                            cell?.label2.text = str
                        }
                    }
                    cell?.emailT.text = model?.chests
                    cell?.icon.image = UIImage(named: typeStr ?? "")
                }
                return cell!
            }else if index == 1 {
                let cellIdentifier = "\(typeStr ?? "")_Cell1"
                var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? ListTwoCell
                if cell == nil {
                    cell = ListTwoCell(style: .default, reuseIdentifier: cellIdentifier)
                    cell?.selectionStyle = .none
                    cell?.emailT.text = model?.addressname
                }
                return cell!
            }else if index == 2 {
                let cellIdentifier = "\(typeStr ?? "")_Cell2"
                var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? ListThreeCell
                if cell == nil {
                    cell = ListThreeCell(style: .default, reuseIdentifier: cellIdentifier)
                    cell?.selectionStyle = .none
                    cell?.emailT.text = model?.distributes
                }
                return cell!
            }else {
                let cellIdentifier = "\(typeStr ?? "")_Cell3"
                var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? ListFourCell
                if cell == nil {
                    cell = ListFourCell(style: .default, reuseIdentifier: cellIdentifier)
                    cell?.selectionStyle = .none
                    cell?.textView.text = model?.knobby
                }
                return cell!
            }
        }else if currentState == .cash1 {
            if index == 0 {
                let cellIdentifier = "\(typeStr ?? "")_cell0"
                var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? ListOneCell
                if cell == nil {
                    cell = ListOneCell(style: .subtitle, reuseIdentifier: cellIdentifier)
                    cell?.backgroundColor = .clear
                    cell?.selectionStyle = .none
                    cell?.label2.backgroundColor = UIColor("#B3EE4B")
                    cell?.lineView.backgroundColor = UIColor("#B3EE4B")
                    cell?.bgView.layer.borderColor = UIColor("#B3EE4B").cgColor
                    if let str = typeStr {
                        if str.contains("Other") {
                            cell?.label2.text = "Other"
                        }else{
                            cell?.label2.text = str
                        }
                    }
                    cell?.emailT.text = model?.chests
                    cell?.icon.image = UIImage(named: typeStr ?? "")
                }
                return cell!
            }else if index == 1 {
                let cellIdentifier = "\(typeStr ?? "")_Cell1"
                var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? ListTwoCell
                if cell == nil {
                    cell = ListTwoCell(style: .default, reuseIdentifier: cellIdentifier)
                    cell?.bgView.layer.borderColor = UIColor("#B3EE4B").cgColor
                    cell?.selectionStyle = .none
                    cell?.icon.image = UIImage(named: "qweasd1")
                    cell?.emailT.text = model?.addressname
                }
                return cell!
            }else if index == 2 {
                let cellIdentifier = "\(typeStr ?? "")_Cell2"
                var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? ListThreeCell
                if cell == nil {
                    cell = ListThreeCell(style: .default, reuseIdentifier: cellIdentifier)
                    cell?.bgView.layer.borderColor = UIColor("#B3EE4B").cgColor
                    cell?.selectionStyle = .none
                    cell?.icon.image = UIImage(named: "qweasd3")
                    cell?.emailT.text = model?.distributes
                }
                return cell!
            }else {
                let cellIdentifier = "\(typeStr ?? "")_Cell3"
                var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? ListFourCell
                if cell == nil {
                    cell = ListFourCell(style: .default, reuseIdentifier: cellIdentifier)
                    cell?.bgView.layer.borderColor = UIColor("#B3EE4B").cgColor
                    cell?.selectionStyle = .none
                    cell?.icon.image = UIImage(named: "qweasd4")
                    cell?.textView.text = model?.knobby
                }
                return cell!
            }
        }else if currentState == .card1 {
            if index == 0 {
                let cellIdentifier = "\(typeStr ?? "")_cell0"
                var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? ListOneCell
                if cell == nil {
                    cell = ListOneCell(style: .subtitle, reuseIdentifier: cellIdentifier)
                    cell?.backgroundColor = .clear
                    cell?.selectionStyle = .none
                    cell?.label2.backgroundColor = UIColor("#FB9A01")
                    cell?.lineView.backgroundColor = UIColor("#FB9A01")
                    cell?.bgView.layer.borderColor = UIColor("#FB9A01").cgColor
                    if let str = typeStr {
                        if str.contains("Other") {
                            cell?.label2.text = "Other"
                        }else{
                            cell?.label2.text = str
                        }
                    }
                    cell?.emailT.text = model?.chests
                    cell?.icon.image = UIImage(named: typeStr ?? "")
                }
                return cell!
            }else if index == 1 {
                let cellIdentifier = "\(typeStr ?? "")_Cell1"
                var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? ListTwoCell
                if cell == nil {
                    cell = ListTwoCell(style: .default, reuseIdentifier: cellIdentifier)
                    cell?.bgView.layer.borderColor = UIColor("#FB9A01").cgColor
                    cell?.selectionStyle = .none
                    cell?.emailT.text = model?.addressname
                    cell?.icon.image = UIImage(named: "qwerty1")
                }
                return cell!
            }else if index == 2 {
                let cellIdentifier = "\(typeStr ?? "")_Cell2"
                var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? ListFiveCell
                if cell == nil {
                    cell = ListFiveCell(style: .default, reuseIdentifier: cellIdentifier)
                    cell?.bgView.layer.borderColor = UIColor("#FB9A01").cgColor
                    cell?.selectionStyle = .none
                    cell?.emailT.text = model?.matched
                    cell?.icon.image = UIImage(named: "qwerty2")
                }
                return cell!
            }else if index == 3 {
                let cellIdentifier = "\(typeStr ?? "")_Cell3"
                var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? ListThreeCell
                if cell == nil {
                    cell = ListThreeCell(style: .default, reuseIdentifier: cellIdentifier)
                    cell?.bgView.layer.borderColor = UIColor("#FB9A01").cgColor
                    cell?.selectionStyle = .none
                    cell?.icon.image = UIImage(named: "qwerty3")
                    cell?.emailT.text = model?.distributes
                }
                return cell!
            }else {
                let cellIdentifier = "\(typeStr ?? "")_Cell4"
                var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? ListFourCell
                if cell == nil {
                    cell = ListFourCell(style: .default, reuseIdentifier: cellIdentifier)
                    cell?.bgView.layer.borderColor = UIColor("#FB9A01").cgColor
                    cell?.selectionStyle = .none
                    cell?.icon.image = UIImage(named: "qwerty4")
                    cell?.textView.text = model?.knobby
                }
                return cell!
            }
        }else if currentState == .card2 {
            if index == 0 {
                let cellIdentifier = "\(typeStr ?? "")_cell0"
                var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? ListOneCell
                if cell == nil {
                    cell = ListOneCell(style: .subtitle, reuseIdentifier: cellIdentifier)
                    cell?.backgroundColor = .clear
                    cell?.selectionStyle = .none
                    if let str = typeStr {
                        if str.contains("Other") {
                            cell?.label2.text = "Other"
                        }else{
                            cell?.label2.text = str
                        }
                    }
                    cell?.label2.backgroundColor = UIColor("#FB9A01")
                    cell?.lineView.backgroundColor = UIColor("#FB9A01")
                    cell?.bgView.layer.borderColor = UIColor("#FB9A01").cgColor
                    cell?.icon.image = UIImage(named: typeStr ?? "")
                    cell?.emailT.text = model?.chests
                }
                return cell!
            }else if index == 1 {
                let cellIdentifier = "\(typeStr ?? "")_Cell1"
                var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? ListTwoCell
                if cell == nil {
                    cell = ListTwoCell(style: .default, reuseIdentifier: cellIdentifier)
                    cell?.selectionStyle = .none
                    cell?.bgView.layer.borderColor = UIColor("#FB9A01").cgColor
                    cell?.icon.image = UIImage(named: "qwerty1")
                    cell?.emailT.text = model?.addressname
                }
                return cell!
            }else if index == 2 {
                let cellIdentifier = "\(typeStr ?? "")_Cell2"
                var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? ListThreeCell
                if cell == nil {
                    cell = ListThreeCell(style: .default, reuseIdentifier: cellIdentifier)
                    cell?.selectionStyle = .none
                    cell?.bgView.layer.borderColor = UIColor("#FB9A01").cgColor
                    cell?.icon.image = UIImage(named: "qwerty3")
                    cell?.emailT.text = model?.distributes
                }
                return cell!
            }else {
                let cellIdentifier = "\(typeStr ?? "")_Cell3"
                var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? ListFourCell
                if cell == nil {
                    cell = ListFourCell(style: .default, reuseIdentifier: cellIdentifier)
                    cell?.selectionStyle = .none
                    cell?.bgView.layer.borderColor = UIColor("#FB9A01").cgColor
                    cell?.icon.image = UIImage(named: "qwerty4")
                    cell?.textView.text = model?.knobby
                }
                return cell!
            }
        }else if currentState == .cash2 {
            if index == 0 {
                let cellIdentifier = "\(typeStr ?? "")_cell0"
                var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? ListOneCell
                if cell == nil {
                    cell = ListOneCell(style: .subtitle, reuseIdentifier: cellIdentifier)
                    cell?.backgroundColor = .clear
                    cell?.selectionStyle = .none
                    if let str = typeStr {
                        if str.contains("Other") {
                            cell?.label2.text = "Other"
                        }else{
                            cell?.label2.text = str
                        }
                    }
                    cell?.label2.backgroundColor = UIColor("#B3EE4B")
                    cell?.lineView.backgroundColor = UIColor("#B3EE4B")
                    cell?.bgView.layer.borderColor = UIColor("#B3EE4B").cgColor
                    cell?.icon.image = UIImage(named: typeStr ?? "")
                    cell?.emailT.text = model?.chests
                }
                return cell!
            }else if index == 1 {
                let cellIdentifier = "\(typeStr ?? "")_Cell1"
                var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? ListTwoCell
                if cell == nil {
                    cell = ListTwoCell(style: .default, reuseIdentifier: cellIdentifier)
                    cell?.selectionStyle = .none
                    cell?.bgView.layer.borderColor = UIColor("#B3EE4B").cgColor
                    cell?.icon.image = UIImage(named: "qweasd1")
                    cell?.emailT.text = model?.addressname
                }
                return cell!
            }else if index == 2 {
                let cellIdentifier = "\(typeStr ?? "")_Cell2"
                var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? ListFiveCell
                if cell == nil {
                    cell = ListFiveCell(style: .default, reuseIdentifier: cellIdentifier)
                    cell?.selectionStyle = .none
                    cell?.label1.text = "Last 4 Digits Of The Card"
                    cell?.emailT.text = model?.matched
                    cell?.emailT.keyboardType = .numberPad
                    cell?.bgView.layer.borderColor = UIColor("#B3EE4B").cgColor
                    cell?.icon.image = UIImage(named: "qweasd2")
                    cell?.emailT.text = model?.matched
                }
                return cell!
            }else if index == 3 {
                let cellIdentifier = "\(typeStr ?? "")_Cell3"
                var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? ListThreeCell
                if cell == nil {
                    cell = ListThreeCell(style: .default, reuseIdentifier: cellIdentifier)
                    cell?.selectionStyle = .none
                    cell?.bgView.layer.borderColor = UIColor("#B3EE4B").cgColor
                    cell?.icon.image = UIImage(named: "qweasd3")
                    cell?.emailT.text = model?.distributes
                }
                return cell!
            }else {
                let cellIdentifier = "\(typeStr ?? "")_Cell4"
                var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? ListFourCell
                if cell == nil {
                    cell = ListFourCell(style: .default, reuseIdentifier: cellIdentifier)
                    cell?.selectionStyle = .none
                    cell?.bgView.layer.borderColor = UIColor("#B3EE4B").cgColor
                    cell?.icon.image = UIImage(named: "qweasd4")
                    cell?.textView.text = model?.knobby
                }
                return cell!
            }
        }else if currentState == .car1 {
            if index == 0 {
                let cellIdentifier = "\(typeStr ?? "")_cell0"
                var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? ListOneCell
                if cell == nil {
                    cell = ListOneCell(style: .subtitle, reuseIdentifier: cellIdentifier)
                    cell?.backgroundColor = .clear
                    cell?.selectionStyle = .none
                    if let str = typeStr {
                        if str.contains("Other") {
                            cell?.label2.text = "Other"
                        }else{
                            cell?.label2.text = str
                        }
                    }
                    cell?.label2.backgroundColor = UIColor("#364880")
                    cell?.lineView.backgroundColor = UIColor("#364880")
                    cell?.bgView.layer.borderColor = UIColor("#364880").cgColor
                    cell?.icon.image = UIImage(named: typeStr ?? "")
                    cell?.emailT.text = model?.chests
                }
                return cell!
            }else if index == 1 {
                let cellIdentifier = "\(typeStr ?? "")_Cell1"
                var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? ListTwoCell
                if cell == nil {
                    cell = ListTwoCell(style: .default, reuseIdentifier: cellIdentifier)
                    cell?.selectionStyle = .none
                    cell?.bgView.layer.borderColor = UIColor("#364880").cgColor
                    cell?.icon.image = UIImage(named: "qazxsw1")
                    cell?.emailT.text = model?.addressname
                }
                return cell!
            }else if index == 2 {
                let cellIdentifier = "\(typeStr ?? "")_Cell2"
                var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? ListThreeCell
                if cell == nil {
                    cell = ListThreeCell(style: .default, reuseIdentifier: cellIdentifier)
                    cell?.selectionStyle = .none
                    cell?.bgView.layer.borderColor = UIColor("#364880").cgColor
                    cell?.icon.image = UIImage(named: "qazxsw2")
                    cell?.emailT.text = model?.distributes
                }
                return cell!
            }else {
                let cellIdentifier = "\(typeStr ?? "")_Cell3"
                var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? ListFourCell
                if cell == nil {
                    cell = ListFourCell(style: .default, reuseIdentifier: cellIdentifier)
                    cell?.selectionStyle = .none
                    cell?.bgView.layer.borderColor = UIColor("#364880").cgColor
                    cell?.icon.image = UIImage(named: "qazxsw3")
                    cell?.textView.text = model?.knobby
                }
                return cell!
            }
        }else {
            if index == 0 {
                let cellIdentifier = "\(typeStr ?? "")_Cell0"
                var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
                if cell == nil {
                    cell = ListOneCell(style: .default, reuseIdentifier: cellIdentifier)
                    cell?.selectionStyle = .none
                }
                return cell!
            }else if index == 1 {
                let cellIdentifier = "\(typeStr ?? "")_Cell1"
                var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
                if cell == nil {
                    cell = ListTwoCell(style: .default, reuseIdentifier: cellIdentifier)
                    cell?.selectionStyle = .none
                }
                return cell!
            }else if index == 2 {
                let cellIdentifier = "\(typeStr ?? "")_Cell2"
                var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
                if cell == nil {
                    cell = ListThreeCell(style: .default, reuseIdentifier: cellIdentifier)
                    cell?.selectionStyle = .none
                }
                return cell!
            }else if index == 3 {
                let cellIdentifier = "\(typeStr ?? "")_Cell3"
                var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
                if cell == nil {
                    cell = ListThreeCell(style: .default, reuseIdentifier: cellIdentifier)
                    cell?.selectionStyle = .none
                }
                return cell!
            }else {
                let cellIdentifier = "\(typeStr ?? "")_Cell4"
                var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
                if cell == nil {
                    cell = ListFourCell(style: .default, reuseIdentifier: cellIdentifier)
                    cell?.selectionStyle = .none
                }
                return cell!
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if currentState == .fund1 || currentState == .card2 || currentState == .cash1 || currentState == .car1 {
            return 4
        }
        return 5
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footView = UIView()
        let btn = UIButton(type: .custom)
        btn.layer.cornerRadius = 28.pix()
        btn.backgroundColor = UIColor("#188DFF")
        btn.setTitle("Confirm", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = UIFont(name: Futura_Bold, size: 16.pix())
        btn.addTarget(self, action: #selector(conFirmClick), for: .touchUpInside)
        footView.addSubview(btn)
        btn.snp.makeConstraints { make in
            make.centerX.equalTo(footView)
            make.left.equalTo(footView).offset(16.pix())
            make.bottom.equalTo(footView)
            make.height.equalTo(56.pix())
        }
        return footView
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 140.pix()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let index = indexPath.row
        if currentState == .fund1 || currentState == .card2 || currentState == .cash1 || currentState == .car1 {
            if index == 0 {
                return 152.pix()
            }else if index == 1 || index == 2 {
                return 110.pix()
            }else {
                return 200.pix()
            }
        }else {
            if index == 0 {
                return 152.pix()
            }else if index == 1 || index == 2 || index == 3 {
                return 110.pix()
            }else {
                return 200.pix()
            }
        }
    }
    
    @objc func conFirmClick() {
        let numberOfSections = tableView.numberOfSections
        for section in 0..<numberOfSections {
            let numberOfRows = tableView.numberOfRows(inSection: section)
            for row in 0..<numberOfRows {
                let indexPath = IndexPath(row: row, section: section)
                if let cell = tableView.cellForRow(at: indexPath) as? ListOneCell {
                    let cellValue = cell.emailT.text ?? ""
                    var money: String = ""
                    if cellValue.contains(",") {
                        let stringWithoutComma = cellValue.replacingOccurrences(of: ",", with: "")
                        money = stringWithoutComma
                    }else{
                        money = cellValue
                    }
                    dict["chests"] = money
                    print("cellValue1>>>>>>\(cellValue)")
                }
                if let cell = tableView.cellForRow(at: indexPath) as? ListTwoCell {
                    let cellValue = cell.emailT.text
                    dict["addressname"] = cellValue
                    print("cellValue2>>>>>>\(cellValue ?? "")")
                }
                if let cell = tableView.cellForRow(at: indexPath) as? ListThreeCell {
                    let cellValue = cell.emailT.text
                    dict["distributes"] = cellValue
                    print("cellValue3>>>>>>\(cellValue ?? "")")
                }
                if let cell = tableView.cellForRow(at: indexPath) as? ListFourCell {
                    let cellValue = cell.textView.text
                    dict["knobby"] = cellValue
                    print("cellValue5>>>>>>\(cellValue ?? "")")
                }
                if let cell = tableView.cellForRow(at: indexPath) as? ListFiveCell {
                    let cellValue = cell.emailT.text
                    dict["matched"] = cellValue
                    print("cellValue4>>>>>>\(cellValue ?? "")")
                }
            }
        }
        self.dictBlock!(dict)
    }
}
