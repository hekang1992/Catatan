//
//  OrderViewController.swift
//  Catatan
//
//  Created by apple on 2024/2/26.
//

import UIKit
import MJRefresh
import HandyJSON

class OrderViewController: BaseViewController {
    
    var nameStr: String?
    
    var typeStr: String?
    
    lazy var orderView: OrderView = {
        let orderView = OrderView()
        return orderView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.s
        addNavView()
        navView.nameLabel.text = nameStr
        navView.block = { [weak self] in
            self?.navigationController?.popViewController(animated: true)
        }
        view.addSubview(orderView)
        view.insertSubview(orderView, belowSubview: navView)
        orderView.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }
        
        self.orderView.tableView.mj_header = MJRefreshNormalHeader(refreshingTarget: self, refreshingAction: #selector(loadNewData))
        self.orderView.tableView.mj_header?.isAutomaticallyChangeAlpha = true
        if let type = typeStr {
            getOrderListInfo(type)
        }
        self.orderView.block = { [weak self] model in
            if let josiah: String = model.josiah {
                if josiah.contains("app.dcatan/terrainShoot") {
                    let splitedArray = josiah.components(separatedBy: "bidders=")
                    self?.getProductDetailInfo(splitedArray.last ?? "",josiah,"")
                }else{
                    self?.pushWebVC(josiah, "")
                }
            }
        }
    }
    
    @objc func loadNewData() {
        if let type = typeStr {
            getOrderListInfo(type)
        }
    }
    
    func getOrderListInfo(_ type: String) {
        let dict = ["alley":type]
        addHudView()
        NetApiWork.shared.requestAPI(params: dict, pageUrl: scoopCould, method: .post) { [weak self] baseModel in
            let awess = baseModel.awareness
            if awess == 0 || awess == 00 {
                let model = JSONDeserializer<HoveredModel>.deserializeFrom(dict: baseModel.hovered)
                let array = model?.incomes
                if let listArray = array {
                    self?.removeEmptyView()
                    self?.orderView.array = listArray
                }else{
                    self?.addEmptyView()
                }
            }
            self?.removeHudView()
            self?.orderView.tableView.reloadData()
            self?.orderView.tableView.mj_header?.endRefreshing()
        } errorBlock: { [weak self] error in
            self?.removeHudView()
            self?.addEmptyView()
            self?.orderView.tableView.mj_header?.endRefreshing()
        }
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
