//
//  HomeOneView.swift
//  Catatan
//
//  Created by apple on 2024/3/5.
//

import UIKit
import Kingfisher
import GKCycleScrollView

typealias IndexHomeBlock = (_ index: NSInteger) -> Void
class HomeOneView: UIView,UITableViewDelegate,UITableViewDataSource, GKCycleScrollViewDataSource {
    
    var dataSourceArray = ["abc3","iconabc","abc4"]
    
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
    
    lazy var cycleScrollView: GKCycleScrollView = {
        let scrollView = GKCycleScrollView(frame: .zero)
        scrollView.dataSource = self
        scrollView.layer.cornerRadius = 22.pix()
        return scrollView
    }()
    
    lazy var footOneView: FootOneView = {
        let footOneView = FootOneView()
        footOneView.backgroundColor = UIColor("#BBD598")
        footOneView.layer.cornerRadius = 32.pix()
        return footOneView
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
        return 400.pix()
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footView = UIView()
        footView.addSubview(cycleScrollView)
        footView.addSubview(footOneView)
        cycleScrollView.snp.makeConstraints { make in
            make.top.equalTo(footView).offset(30.pix())
            make.centerX.equalTo(footView)
            make.left.equalTo(footView).offset(17.pix())
            make.height.equalTo(127.pix())
        }
        footOneView.snp.makeConstraints { make in
            make.left.equalTo(footView).offset(17.pix())
            make.top.equalTo(cycleScrollView.snp.top).offset(89.pix())
            make.centerX.equalTo(footView)
            make.height.equalTo(290.pix())
        }
        cycleScrollView.reloadData()
        return footView
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.blcok!(indexPath.row)
    }
    
    func numberOfCells(in cycleScrollView: GKCycleScrollView!) -> Int {
        return 3
    }
    
    func cycleScrollView(_ cycleScrollView: GKCycleScrollView!, cellForViewAt index: Int) -> GKCycleScrollViewCell! {
        var cell = cycleScrollView.dequeueReusableCell()
        if cell == nil {
            cell = GKCycleScrollViewCell()
        }
        cell?.imageView.image = UIImage(named: dataSourceArray[index] as String)
        return cell!
    }
}
