//
//  ListView.swift
//  Catatan
//
//  Created by apple on 2024/3/27.
//

import UIKit

class ListView: UIView,UITableViewDelegate,UITableViewDataSource {
    
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
        if index == 0 {
            let cellIdentifier = "Cell"
            var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
            if cell == nil {
                cell = ListOneCell(style: .default, reuseIdentifier: cellIdentifier)
                cell?.selectionStyle = .none
            }
            return cell!
        }else if index == 1{
            let cellIdentifier = "Cell"
            var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
            if cell == nil {
                cell = ListTwoCell(style: .default, reuseIdentifier: cellIdentifier)
                cell?.selectionStyle = .none
            }
            return cell!
        }else if index == 2{
            let cellIdentifier = "Cell"
            var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
            if cell == nil {
                cell = ListThreeCell(style: .default, reuseIdentifier: cellIdentifier)
                cell?.selectionStyle = .none
            }
            return cell!
        }else {
            let cellIdentifier = "Cell"
            var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
            if cell == nil {
                cell = ListFourCell(style: .default, reuseIdentifier: cellIdentifier)
                cell?.selectionStyle = .none
            }
            return cell!
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let index: Int = indexPath.row
        if index == 0 {
            return 160.pix()
        }else{
            return 220.pix()
        }
    }
    
}
