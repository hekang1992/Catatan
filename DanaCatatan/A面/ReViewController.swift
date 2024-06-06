//
//  ReViewController.swift
//  Catatan
//
//  Created by apple on 2024/3/29.
//

import UIKit
import HandyJSON
import MJRefresh

class ReViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource {
    
    var model: HoveredModel?
    
    lazy var bgView1: UIView = {
        let bgView = UIView()
        bgView.backgroundColor = UIColor("#F4F8EE")
        return bgView
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor("#F4F8EE")
        return tableView
    }()
    
    lazy var nodaView: FNodataView = {
        let nodaView = FNodataView()
        nodaView.frame = CGRect(x: 0, y: 150.pix(), width: SCREEN_WIDTH, height: SCREEN_HEIGHT - 150.pix())
        return nodaView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        addNavView()
        navView.nameLabel.text = "Recycle Bin"
        navView.block = { [weak self] in
            self?.navigationController?.popViewController(animated: true)
        }
        view.insertSubview(bgView1, belowSubview: navView)
        bgView1.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }
        bgView1.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(bgView1)
        }
        self.tableView.mj_header = MJRefreshNormalHeader(refreshingTarget: self, refreshingAction: #selector(loadNewData))
        self.tableView.mj_header?.isAutomaticallyChangeAlpha = true
        huishouzhan()
    }
    
    @objc func loadNewData() {
        huishouzhan()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.model?.incomes?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90.pix()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let homeOneCellID = "homeOneCellID"
        guard let modelArray = self.model?.incomes else { return UITableViewCell() }
        let model = modelArray[indexPath.row]
        let cell = OAViewCell(style: .subtitle, reuseIdentifier: homeOneCellID)
        cell.selectionStyle = .none
        cell.backgroundColor = .clear
        cell.model = model
        return cell
    }
    
    func huishouzhan() {
        addHudView()
        let dict: [String: Any] = [:]
        NetApiWork.shared.requestAPI(params: dict, pageUrl: beforeStrips, method: .post) { [weak self] baseModel in
            let awess = baseModel.awareness
            if awess == 0 || awess == 00 {
                let dict = baseModel.hovered
                let inModel = JSONDeserializer<HoveredModel>.deserializeFrom(dict: dict)
                self?.model = inModel
                if inModel?.incomes?.count == 0 {
                    self?.tableView.addSubview(self!.nodaView)
                }else{
                    self?.nodaView.removeFromSuperview()
                }
            }else{
                self?.tableView.addSubview(self!.nodaView)
            }
            self?.removeHudView()
            self?.tableView.reloadData()
            self?.tableView.mj_header?.endRefreshing()
        } errorBlock: { [weak self] error in
            self?.removeHudView()
            self?.tableView.addSubview(self!.nodaView)
            self?.tableView.mj_header?.endRefreshing()
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
