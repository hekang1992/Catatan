//
//  OAViewController.swift
//  Catatan
//
//  Created by apple on 2024/3/18.
//

import UIKit
import GKCycleScrollView
import MJRefresh

class OAViewController: BaseViewController, GKCycleScrollViewDataSource, GKCycleScrollViewDelegate, UITableViewDelegate,UITableViewDataSource {
    
    var dataSourceArray = ["abce1234","abce1235","abce1236"]
    
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
        btn.setBackgroundImage(UIImage(named: "rew12"), for: .normal)
        btn.addTarget(self, action: #selector(btnClick1), for: .touchUpInside)
        return btn
    }()
    
    lazy var cycleScrollView: GKCycleScrollView = {
        let scrollView = GKCycleScrollView(frame: .zero)
        scrollView.dataSource = self
        scrollView.delegate = self
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
        btn.setImage(UIImage(named: "icon_add"), for: .normal)
        btn.addTarget(self, action: #selector(btnClick(_:)), for: .touchUpInside)
        return btn
    }()
    
    lazy var btn2: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setImage(UIImage(named: "icon_Bills"), for: .normal)
        btn.addTarget(self, action: #selector(btnClick(_:)), for: .touchUpInside)
        return btn
    }()
    
    lazy var btn3: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setImage(UIImage(named: "icon_seet"), for: .normal)
        btn.addTarget(self, action: #selector(btnClick(_:)), for: .touchUpInside)
        return btn
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = UIColor("#F4F8EE")
        return tableView
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
            make.size.equalTo(CGSize(width: 100.pix(), height: 34.pix()))
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
    
    func sizeForCell(in cycleScrollView: GKCycleScrollView) -> CGSize {
        return CGSize(width: 253.pix(), height: 130.pix())
    }
    
    @objc func btnClick1() {
        
    }
    
    @objc func btnClick(_ sender: UIButton) {
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.pix()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let homeOneCellID = "homeOneCellID"
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: homeOneCellID)
        cell.textLabel?.text = "fadsfas"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 118.pix()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headView = UIView()
        let iconImageView = UIImageView()
        iconImageView.contentMode = .scaleAspectFill
        iconImageView.image = UIImage(named: "image_bg")
        headView.addSubview(iconImageView)
        iconImageView.snp.makeConstraints { make in
            make.edges.equalTo(headView).inset(UIEdgeInsets(top: 0, left: 0, bottom: 10.pix(), right: 0))
        }
        var label1 = UILabel.createLabel(font: UIFont(name: Futura_Bold, size: 17.pix()) ?? UIFont.boldSystemFont(ofSize: 17.pix()), textColor: UIColor("#081645"), textAlignment: .center)
        label1.text = "Total expenses"
        iconImageView.addSubview(label1)
        label1.snp.makeConstraints { make in
            make.centerX.equalTo(iconImageView)
            make.top.equalTo(iconImageView).offset(21.pix())
            make.height.equalTo(15.pix())
        }
        var label2 = UILabel.createLabel(font: UIFont(name: Futura_Bold, size: 32.pix()) ?? UIFont.boldSystemFont(ofSize: 32.pix()), textColor: UIColor("#081645"), textAlignment: .center)
        label2.text = "$20,140.00"
        iconImageView.addSubview(label2)
        label2.snp.makeConstraints { make in
            make.centerX.equalTo(iconImageView)
            make.top.equalTo(label1.snp.bottom).offset(10.pix())
            make.height.equalTo(40.pix())
        }
        return headView
    }
    
    @objc func loadNewData() {
        
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
