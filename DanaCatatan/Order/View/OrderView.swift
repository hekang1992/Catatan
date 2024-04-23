//
//  OrderView.swift
//  Catatan
//
//  Created by apple on 2024/3/13.
//

import UIKit

class OrderView: UIView,UITableViewDelegate,UITableViewDataSource {
    
    var array: [IncomesModel] = []
    
    var block: ((_ model: IncomesModel) -> Void)?

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
        let vinViewCellID = "VinViewCellID"
        let cell = OrderNormalCell(style: .subtitle, reuseIdentifier: vinViewCellID)
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        let model = array[indexPath.row]
        cell.model = model
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let model = array[indexPath.row]
        if model.masters == "2" || model.masters == "3" {
            return 124.pix()
        }
        return 154.pix()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40.pix()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        return view
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = array[indexPath.row]
        self.block!(model)
    }

}
