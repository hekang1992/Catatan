//
//  TimeAlertView.swift
//  Catatan
//
//  Created by apple on 2024/4/7.
//

import UIKit

class TimeAlertView: UIView,UITableViewDelegate,UITableViewDataSource {
    
    var block: ((String) -> Void)?
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TimeAlertCell.self, forCellReuseIdentifier: "CellIdentifier")
        tableView.estimatedSectionHeaderHeight = 0
        tableView.estimatedSectionFooterHeight = 0
        return tableView
    }()
    
    lazy var bgView: UIView = {
        let bgView = UIView()
        bgView.backgroundColor = .white
        return bgView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(bgView)
        bgView.addSubview(tableView)
        bgView.snp.makeConstraints { make in
            make.bottom.left.right.equalTo(self)
            make.height.equalTo(500.pix())
        }
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(bgView)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        bgView.roundCorners(corners: [.topLeft, .topRight], radius: 20.pix())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index: Int = indexPath.row
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellIdentifier", for: indexPath) as? TimeAlertCell
        if index == 0 {
            cell?.lable.text = "Never"
        }else if index == 1 {
            cell?.lable.text = "1st of the month"
        }else if index == 2 {
            cell?.lable.text = "2nd of the month"
        }else if index == 3 {
            cell?.lable.text = "3rd of the month"
        }else {
            cell?.lable.text = "\(index)th of the month"
        }
        cell?.selectionStyle = .none
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 29
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 66.pix()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let index: Int = indexPath.row
        if let cell = tableView.cellForRow(at: indexPath) as? TimeAlertCell {
            self.block!(cell.lable.text ?? "")
        }
    }
}
