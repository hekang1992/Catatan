//
//  OAViewController.swift
//  Catatan
//
//  Created by apple on 2024/3/18.
//

import UIKit
import GKCycleScrollView
import MJRefresh
import SwipeCellKit
import MBProgressHUD_WJExtension
import TYAlertController
import HandyJSON

class OAViewController: BaseViewController, GKCycleScrollViewDataSource, GKCycleScrollViewDelegate, UITableViewDelegate,UITableViewDataSource, SwipeTableViewCellDelegate {
    
    var selectIndex: Int = 0
    
    var dataSourceArray = ["bank1","bank3","bank2","bank4"]
    
    var model: HoveredModel?
    
    lazy var bgView1: UIView = {
        let bgView = UIView()
        bgView.backgroundColor = UIColor("#F4F8EE")
        return bgView
    }()
    
    lazy var titleLabel: UILabel = {
        let titleLabel = UILabel.createLabel(font: UIFont(name: Futura_Bold, size: 18.pix()) ?? UIFont.boldSystemFont(ofSize: 18.pix()), textColor: UIColor("#081645"), textAlignment: .left)
        titleLabel.text = "Hello!"
        return titleLabel
    }()
    
    lazy var titleLabel1: UILabel = {
        let titleLabel = UILabel.createLabel(font: UIFont(name: Futura_Medium, size: 12.pix()) ?? UIFont.boldSystemFont(ofSize: 12.pix()), textColor: UIColor("#373D54"), textAlignment: .left)
        titleLabel.text = "How are you today?"
        return titleLabel
    }()
    
    lazy var btn: UIButton = {
        let btn = UIButton(type: .custom)
        btn.tag = 1001
        btn.setBackgroundImage(UIImage(named: "rew12"), for: .normal)
        btn.addTarget(self, action: #selector(btnClick(_:)), for: .touchUpInside)
        return btn
    }()
    
    lazy var cycleScrollView: GKCycleScrollView = {
        let scrollView = GKCycleScrollView(frame: .zero)
        scrollView.dataSource = self
        scrollView.delegate = self
        scrollView.isInfiniteLoop = false
        scrollView.isAutoScroll = false
        scrollView.isChangeAlpha = false;
        scrollView.leftRightMargin = 20.pix()
        return scrollView
    }()
    
    lazy var iconImageView: UIImageView = {
        let iconImageView = UIImageView()
        iconImageView.image = UIImage(named: "home666")
        iconImageView.isUserInteractionEnabled = true
        return iconImageView
    }()
    
    lazy var btn1: UIButton = {
        let btn = UIButton(type: .custom)
        btn.tag = 1002
        btn.setImage(UIImage(named: "icon_add"), for: .normal)
        btn.addTarget(self, action: #selector(btnClick(_:)), for: .touchUpInside)
        return btn
    }()
    
    lazy var btn2: UIButton = {
        let btn = UIButton(type: .custom)
        btn.tag = 1003
        btn.setImage(UIImage(named: "icon_Bills"), for: .normal)
        btn.addTarget(self, action: #selector(btnClick(_:)), for: .touchUpInside)
        return btn
    }()
    
    lazy var btn3: UIButton = {
        let btn = UIButton(type: .custom)
        btn.tag = 1004
        btn.setImage(UIImage(named: "icon_seet"), for: .normal)
        btn.addTarget(self, action: #selector(btnClick(_:)), for: .touchUpInside)
        return btn
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
        nodaView.frame = self.tableView.bounds
        return nodaView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let stackView = UIStackView(arrangedSubviews: [btn1, btn2, btn3])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 58.pix()
        
        // Do any additional setup after loading the view.
        bgView.hide()
        view.addSubview(bgView1)
        bgView1.addSubview(titleLabel)
        bgView1.addSubview(titleLabel1)
        bgView1.addSubview(btn)
        bgView1.addSubview(cycleScrollView)
        bgView1.addSubview(iconImageView)
        iconImageView.addSubview(stackView)
        iconImageView.addSubview(tableView)
        bgView1.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }
        titleLabel.snp.makeConstraints { make in
            make.left.equalTo(bgView1).offset(20)
            make.top.equalTo(bgView1).offset(CGFloat(STATUSBAR_HIGH) + 6.pix())
            make.height.equalTo(24.pix())
        }
        titleLabel1.snp.makeConstraints { make in
            make.left.equalTo(bgView1).offset(20)
            make.top.equalTo(titleLabel.snp.bottom).offset(4.pix())
            make.height.equalTo(15.pix())
        }
        btn.snp.makeConstraints { make in
            make.right.equalTo(bgView1).offset(-20.pix())
            make.size.equalTo(CGSize(width: 73.pix(), height: 34.pix()))
            make.top.equalTo(titleLabel.snp.top).offset(6.pix())
        }
        cycleScrollView.snp.makeConstraints { make in
            make.top.equalTo(btn.snp.bottom).offset(28.pix())
            make.left.equalTo(bgView1).offset(-90.pix())
            make.right.equalTo(bgView1)
            make.height.equalTo(130.pix())
        }
        iconImageView.snp.makeConstraints { make in
            make.left.right.bottom.equalTo(bgView1)
            make.top.equalTo(cycleScrollView.snp.top).offset(70.pix())
        }
        stackView.snp.makeConstraints { make in
            make.top.equalTo(iconImageView.snp.top).offset(36.pix())
            make.left.equalTo(bgView1).offset(55.pix())
            make.centerX.equalTo(bgView1)
            make.height.equalTo(60.pix())
        }
        tableView.snp.makeConstraints { make in
            make.top.equalTo(iconImageView).offset(100.pix())
            make.left.right.bottom.equalTo(iconImageView)
        }
        tableView.mj_header = MJRefreshNormalHeader(refreshingTarget: self, refreshingAction: #selector(loadNewData))
        cycleScrollView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getHomeFData(selectIndex + 1)
    }
    
    func getHomeFData(_ type: Int) {
        addHudView()
        let dict: [String: Any] = ["school":type]
        NetApiWork.shared.requestAPI(params: dict, pageUrl: firstWhite, method: .post) { [weak self] model in
            let awareness = model.awareness
            if awareness == 0 || awareness == 00 {
                let dict = model.hovered
                let inModel = JSONDeserializer<HoveredModel>.deserializeFrom(dict: dict)
                if let model = inModel {
                    self?.model = model
                    if model.incomes?.count == 0 {
                        self?.tableView.addSubview(self!.nodaView)
                    }else{
                        self?.nodaView.removeFromSuperview()
                    }
                }else{
                    self?.tableView.addSubview(self!.nodaView)
                }
                self?.tableView.reloadData()
            }
            self?.removeHudView()
            self?.tableView.mj_header?.endRefreshing()
        } errorBlock: { [weak self] error in
            self?.removeHudView()
            self?.tableView.mj_header?.endRefreshing()
        }
    }
    
    func numberOfCells(in cycleScrollView: GKCycleScrollView!) -> Int {
        return dataSourceArray.count
    }
    
    func cycleScrollView(_ cycleScrollView: GKCycleScrollView!, cellForViewAt index: Int) -> GKCycleScrollViewCell! {
        var cell = cycleScrollView.dequeueReusableCell()
        if cell == nil {
            cell = GKCycleScrollViewCell()
        }
        cell?.imageView.image = UIImage(named: dataSourceArray[index] as String)
        return cell!
    }
    
    func cycleScrollView(_ cycleScrollView: GKCycleScrollView!, didScrollCellTo index: Int) {
        selectIndex = index
        getHomeFData(selectIndex + 1)
        print("selectIndex>>>>>>>>>\(selectIndex)")
    }
    
    func sizeForCell(in cycleScrollView: GKCycleScrollView) -> CGSize {
        return CGSize(width: 253.pix(), height: 130.pix())
    }
    
    @objc func btnClick(_ sender: UIButton) {
        let index = sender.tag
        switch index {
        case 1001:
            let tipsView = TipsView()
            tipsView.block = { [weak self] in
                self?.dismiss(animated: true)
            }
            tipsView.frame = self.view.bounds
            let alertVC = TYAlertController(alert: tipsView, preferredStyle: .alert, transitionAnimation: .dropDown)
            self.present(alertVC!, animated: true)
            break
        case 1002:
            if IS_LOGIN {
                alertListView(selectIndex)
            }else {
                let login = LoginFakeViewController()
                let nav = BaseNavViewController(rootViewController: login)
                nav.modalPresentationStyle = .overFullScreen
                present(nav, animated: true, completion: nil)
            }
            break
        case 1003:
            if IS_LOGIN {
                MBProgressHUD.wj_showPlainText("bills", view: nil)
            }else{
                let login = LoginFakeViewController()
                let nav = BaseNavViewController(rootViewController: login)
                nav.modalPresentationStyle = .overFullScreen
                present(nav, animated: true, completion: nil)
            }
            break
        case 1004:
            let setVc = SetViewController()
            self.navigationController?.pushViewController(setVc, animated: true)
            break
        default:
            break
        }
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return self.model?.incomes?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.pix()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let homeOneCellID = "homeOneCellID"
        guard let modelArray = self.model?.incomes else { return UITableViewCell() }
        let model = modelArray[indexPath.row]
        let cell = OAViewCell(style: .subtitle, reuseIdentifier: homeOneCellID)
        cell.delegate = self
        cell.selectionStyle = .none
        cell.backgroundColor = .clear
        cell.model = model
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 138.pix()
        }else{
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headView = UIView()
        if section == 0 {
            let iconImageView = UIImageView()
            iconImageView.contentMode = .scaleAspectFill
            iconImageView.image = UIImage(named: "image_bg")
            headView.addSubview(iconImageView)
            iconImageView.snp.makeConstraints { make in
                make.edges.equalTo(headView).inset(UIEdgeInsets(top: 0, left: 0, bottom: 10.pix(), right: 0))
            }
            let label1 = UILabel.createLabel(font: UIFont(name: Futura_Bold, size: 17.pix()) ?? UIFont.boldSystemFont(ofSize: 17.pix()), textColor: UIColor("#081645"), textAlignment: .center)
            label1.text = "Total expenses"
            iconImageView.addSubview(label1)
            label1.snp.makeConstraints { make in
                make.centerX.equalTo(iconImageView)
                make.top.equalTo(iconImageView).offset(21.pix())
                make.height.equalTo(15.pix())
            }
            let label2 = UILabel.createLabel(font: UIFont(name: Futura_Bold, size: 32.pix()) ?? UIFont.boldSystemFont(ofSize: 32.pix()), textColor: UIColor("#081645"), textAlignment: .center)
            label2.text = self.model?.galloped ?? "0.00"
            iconImageView.addSubview(label2)
            label2.snp.makeConstraints { make in
                make.centerX.equalTo(iconImageView)
                make.top.equalTo(label1.snp.bottom).offset(10.pix())
                make.height.equalTo(40.pix())
            }
        }
        return headView
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> [SwipeAction]? {
        guard orientation == .right else { return nil }
        let deleteAction = SwipeAction(style: .destructive, title: "Delete") { action, indexPath in
            // handle action by updating model with deletion
            print("Delete>>>>>Delete")
        }
        return [deleteAction]
    }
    
    @objc func loadNewData() {
        getHomeFData(selectIndex + 1)
    }
    
    func alertListView(_ index: Int) {
        if selectIndex == 0 {
            alertBank("ins1","ins2","Fund1","Fund2","Fund3","Fund4",0)
        }else if selectIndex == 1 {
            alertBank("ins5","ins6","Loan1","Loan2","Loan3","Loan4",1)
        }else if selectIndex == 2 {
            alertBank("ins3","ins4","Cash1","Cash2","Cash3","Cash4",2)
        }else {
            alertBank("ins7","ins8","Car1","Car2","Car3","Car4",3)
        }
    }
    
    func alertBank(_ image1: String, _ image2: String, _ image3: String, _ image4: String, _ image5: String, _ image6: String, _ selectIndex: Int) {
        let bankListView = BankListView()
        bankListView.iconImageViwe1.image = UIImage(named: image1)
        bankListView.iconImageViwe2.image = UIImage(named: image2)
        bankListView.btn1.setImage(UIImage(named: image3), for: .normal)
        bankListView.btn2.setImage(UIImage(named: image4), for: .normal)
        bankListView.btn3.setImage(UIImage(named: image5), for: .normal)
        bankListView.btn4.setImage(UIImage(named: image6), for: .normal)
        bankListView.frame = self.view.bounds
        let alertVC = TYAlertController(alert: bankListView, preferredStyle: .alert)
        self.present(alertVC!, animated: true)
        bankListView.block1 = { [weak self] in
            self?.dismiss(animated: true, completion: {
                if selectIndex == 0 {
                    self?.pushListVc("Fund",selectIndex)
                }else if selectIndex == 1 {
                    self?.pushListVc("Cash",selectIndex)
                }else if selectIndex == 2 {
                    self?.pushListVc("Credit Card",selectIndex)
                }else {
                    self?.pushListVc("Car",selectIndex)
                }
            })
        }
        bankListView.block2 = { [weak self] in
            self?.dismiss(animated: true, completion: {
                if selectIndex == 0 {
                    self?.pushListVc("Bank Wealth",selectIndex)
                }else if selectIndex == 1 {
                    self?.pushListVc("Credit Limit",selectIndex)
                }else if selectIndex == 2 {
                    self?.pushListVc("Loan",selectIndex)
                }else {
                    self?.pushListVc("House",selectIndex)
                }
            })
        }
        bankListView.block3 = { [weak self] in
            self?.dismiss(animated: true, completion: {
                if selectIndex == 0 {
                    self?.pushListVc("Insurance",selectIndex)
                }else if selectIndex == 1 {
                    self?.pushListVc("Debit Card",selectIndex)
                }else if selectIndex == 2 {
                    self?.pushListVc("Payment",selectIndex)
                }else {
                    self?.pushListVc("Equipment",selectIndex)
                }
            })
        }
        bankListView.block4 = { [weak self] in
            self?.dismiss(animated: true, completion: {
                if selectIndex == 0 {
                    self?.pushListVc("Other",selectIndex)
                }else if selectIndex == 1 {
                    self?.pushListVc("Other",selectIndex)
                }else if selectIndex == 2 {
                    self?.pushListVc("Other",selectIndex)
                }else {
                    self?.pushListVc("Other",selectIndex)
                }
            })
        }
    }
    
    func pushListVc(_ type: String, _ index: Int) {
        let listVc = ListFakeViewController()
        listVc.titleStr = type
        listVc.index = index
        self.navigationController?.pushViewController(listVc, animated: true)
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
