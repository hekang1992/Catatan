//
//  HomeOneView.swift
//  Catatan
//
//  Created by apple on 2024/3/5.
//

import UIKit
import Kingfisher

typealias IndexHomeBlock = (_ index: NSInteger) -> Void
class HomeOneView: UIView,UITableViewDelegate,UITableViewDataSource {
    
    var blcok: IndexHomeBlock?
    
    var largeDataModel: [DrawingModel] = []
    
    lazy var iconImageView: UIImageView = {
        let iconImageView = UIImageView()
        iconImageView.backgroundColor = .white
        iconImageView.layer.cornerRadius = 8.pix()
        return iconImageView
    }()
    
    lazy var label: UILabel = {
        let label = UILabel.createLabel(font: UIFont.systemFont(ofSize: 18.pix(), weight: .semibold), textColor: .black, textAlignment: .left)
        return label
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(iconImageView)
        addSubview(label)
        addSubview(tableView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        iconImageView.snp.makeConstraints { make in
            make.left.equalTo(self).offset(16.pix())
            make.size.equalTo(CGSize(width: 31.pix(), height: 31.pix()))
            make.top.equalTo(self).offset(CGFloat(STATUSBAR_HIGH) + 10.pix())
        }
        label.snp.makeConstraints { make in
            make.left.equalTo(self).offset(55.pix())
            make.centerY.equalTo(iconImageView.snp.centerY)
            make.height.equalTo(25.pix())
        }
        tableView.snp.makeConstraints { make in
            make.bottom.left.right.equalTo(self)
            make.top.equalTo(label.snp_bottomMargin).offset(27.pix())
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let homeOneCellID = "homeOneCellID"
        let cell = HomeOneCell(style: .subtitle, reuseIdentifier: homeOneCellID)
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        let model = largeDataModel[indexPath.row]
        cell.model = model
        self.label.text = model.plumb
        let imageUrl = URL(string: model.auctions ?? "")
        self.iconImageView.kf.setImage(with: imageUrl)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return largeDataModel.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200.pix()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 4.pix()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headView = UIView()
        return headView
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 100.pix()
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footView = UIView()
        footView.backgroundColor = .random()
        return footView
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.blcok!(indexPath.row)
    }
    
}
