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
    var block2: ProductUrlBlock?
    
    var largeDataModel: [DrawingModel]?
    
    var largeDataModel1: [DrawingModel]?
    
    var smodel: SellingModel?//fudai
    
    var type: String?
    
    lazy var iconImageView: UIImageView = {
        let iconImageView = UIImageView()
        iconImageView.image = UIImage(named: "qweerc")
        iconImageView.layer.cornerRadius = 8.pix()
        iconImageView.layer.masksToBounds = true
        return iconImageView
    }()
    
    lazy var label: UILabel = {
        let label = UILabel.createLabel(font: UIFont.systemFont(ofSize: 18.pix(), weight: .semibold), textColor: .black, textAlignment: .left)
        label.text = "MoneyAsisten"
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
        scrollView.leftRightMargin = 8.pix()
        return scrollView
    }()
    
    lazy var fudaiView: FuDaiView = {
        let fudaiView = FuDaiView()
        fudaiView.block = { [weak self] in
            self?.block2!("")
        }
        return fudaiView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(iconImageView)
        addSubview(label)
        addSubview(tableView)
        
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
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        cycleScrollView.setNeedsLayout()
        self.layoutIfNeeded()
        let pageControl1 = GKPageControl(frame: .zero)
        pageControl1.style = .rectangle
        cycleScrollView.pageControl = pageControl1
        cycleScrollView.addSubview(pageControl1)
        pageControl1.snp.makeConstraints { make in
            make.bottom.equalTo(cycleScrollView).offset(-5.pix())
            make.left.equalTo(cycleScrollView).offset(10.pix())
            make.size.equalTo(CGSize(width: 120.pix(), height: 10.pix()))
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let ProductCellID = "ProductCellID_\(indexPath.section)"
        let model = largeDataModel?[indexPath.section]
        let typeStr = model?.masters
        self.label.text = self.type
        let imageUrl = URL(string: model?.auctions ?? "")
        self.iconImageView.kf.setImage(with: imageUrl, placeholder: UIImage(named: "qweerc"))
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
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return largeDataModel?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let model = largeDataModel?[indexPath.section]
        let typeStr = model?.masters
        if typeStr == "1" || typeStr == "3" {
            return 120.pix()
        }else {
            return 140.pix()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            if smodel == nil {
                return 130.pix()
            }else{
                return 240.pix()
            }
        }else if section == 1 {
            return 0
        }else {
            return 18.pix()
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headView = UIView()
        if section == 0 {
            headView.addSubview(cycleScrollView)
            if smodel == nil {
                cycleScrollView.snp.makeConstraints { make in
                    make.top.equalTo(headView).offset(10.pix())
                    make.centerX.equalTo(headView)
                    make.left.equalTo(headView).offset(9.pix())
                    make.height.equalTo(111.pix())
                }
            }else{
                headView.addSubview(fudaiView)
                fudaiView.label.text = smodel?.reckon
                fudaiView.label1.text = smodel?.managers
                cycleScrollView.snp.makeConstraints { make in
                    make.top.equalTo(headView).offset(10.pix())
                    make.centerX.equalTo(headView)
                    make.left.equalTo(headView).offset(9.pix())
                    make.height.equalTo(111.pix())
                }
                fudaiView.snp.makeConstraints { make in
                    make.bottom.equalTo(headView).offset(-20.pix())
                    make.top.equalTo(cycleScrollView.snp.bottom).offset(18.pix())
                    make.left.right.equalTo(headView)
                }
            }
        }else {}
        cycleScrollView.reloadData()
        return headView
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = largeDataModel?[indexPath.section]
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
