//
//  HomeTwoView.swift
//  Catatan
//
//  Created by apple on 2024/3/5.
//

import UIKit
import GKCycleScrollView
import Kingfisher

typealias ProductUrlBlock = (String) -> Void
class HomeTwoView: UIView, GKCycleScrollViewDataSource,UITableViewDelegate,UITableViewDataSource,GKCycleScrollViewDelegate {
    
    var block: ProductUrlBlock?
    var block1: ProductUrlBlock?
    
    var largeDataModel: [DrawingModel]?
    
    var largeDataModel1: [DrawingModel]?
    
    var smodel: SellingModel?
    
    lazy var iconImageView: UIImageView = {
        let iconImageView = UIImageView()
        iconImageView.image = UIImage(named: "qweerc")
        return iconImageView
    }()
    
    lazy var label: UILabel = {
        let label = UILabel.createLabel(font: UIFont.systemFont(ofSize: 18.pix(), weight: .semibold), textColor: .black, textAlignment: .left)
        label.text = "DanaCatatan"
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
        scrollView.delegate = self
        scrollView.layer.cornerRadius = 22.pix()
        scrollView.minimumCellAlpha = 0.0;
        return scrollView
    }()
    
    lazy var fudaiView: FuDaiView = {
        let fudaiView = FuDaiView()
        return fudaiView
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
        self.cycleScrollView.setNeedsLayout()
        self.layoutIfNeeded()
        let pageControl1 = GKPageControl(frame: CGRect(x: 0, y: self.cycleScrollView.frame.size.height - 15.pix(), width: 160.pix(), height: 15.pix()))
        pageControl1.style = .rectangle
        self.cycleScrollView.pageControl = pageControl1
        self.cycleScrollView.addSubview(pageControl1)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let ProductCellID = "ProductCellID_\(indexPath.row)"
        let model = largeDataModel?[indexPath.row]
        let typeStr = model?.masters
        if typeStr == "1" || typeStr == "3" {
            let cell = ProductCell(style: .subtitle, reuseIdentifier: ProductCellID)
            cell.backgroundColor = .clear
            cell.selectionStyle = .none
            cell.model = model
            return cell
        }else {
            let cell = ProductProCell(style: .subtitle, reuseIdentifier: ProductCellID)
            cell.backgroundColor = .clear
            cell.selectionStyle = .none
            cell.model = model
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return largeDataModel?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let model = largeDataModel?[indexPath.row]
        let typeStr = model?.masters
        if typeStr == "1" || typeStr == "3" {
            return 140.pix()
        }else {
            return 160.pix()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if smodel == nil {
            return 130.pix()
        }else{
            return 220.pix()
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headView = UIView()
        headView.addSubview(cycleScrollView)
        if smodel == nil {
            cycleScrollView.snp.makeConstraints { make in
                make.top.equalTo(headView).offset(10.pix())
                make.centerX.equalTo(headView)
                make.left.equalTo(headView).offset(17.pix())
                make.height.equalTo(111.pix())
            }
        }else{
            headView.addSubview(fudaiView)
            cycleScrollView.snp.makeConstraints { make in
                make.top.equalTo(headView).offset(10.pix())
                make.centerX.equalTo(headView)
                make.left.equalTo(headView).offset(17.pix())
                make.height.equalTo(111.pix())
            }
            fudaiView.snp.makeConstraints { make in
                make.bottom.equalTo(headView).offset(-5.pix())
                make.top.equalTo(cycleScrollView.snp.bottom).offset(18.pix())
                make.left.right.equalTo(headView)
            }
        }
        cycleScrollView.reloadData()
        return headView
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = largeDataModel?[indexPath.row]
        let productID = model?.tradition ?? ""
        self.block!(productID)
    }
    
    func numberOfCells(in cycleScrollView: GKCycleScrollView!) -> Int {
        return largeDataModel1?.count ?? 0
    }
    
    func cycleScrollView(_ cycleScrollView: GKCycleScrollView!, cellForViewAt index: Int) -> GKCycleScrollViewCell! {
        var cell = cycleScrollView.dequeueReusableCell()
        if cell == nil {
            cell = GKCycleScrollViewCell()
        }
        let model = largeDataModel1?[index]
        let imageUrl = URL(string: model?.favors ?? "")
        cell?.imageView.kf.setImage(with: imageUrl, placeholder: UIImage(named: "bannetN"))
        return cell!
    }
    
    func cycleScrollView(_ cycleScrollView: GKCycleScrollView!, didSelectCellAt index: Int) {
        let model = largeDataModel1?[index]
        let productUrl: String = model?.occurred ?? ""
        if productUrl.isEmpty {
            return
        }else{
            self.block1!(productUrl)
        }
    }
    
}
