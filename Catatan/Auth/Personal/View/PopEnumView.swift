//
//  PopEnumView.swift
//  Catatan
//
//  Created by apple on 2024/3/7.
//

import UIKit
import JXGradientKit

typealias InfoBlock = (InfoCell,String,String) -> Void
class PopEnumView: UIView, UITableViewDelegate, UITableViewDataSource {
    
    var modelArray:[CustomerModel]?
    
    var titleStr: String?
    
    var block: InfoBlock?
    
    lazy var bgView: UIView = {
        let bgView = GradientView()
        let topColer = UIColor("#E4D7EF")
        let minColer = UIColor("#DEE9CF")
        let booColer = UIColor("#E2EFF3")
        bgView.direction = GradientDirection.topToBottom
        bgView.startColor = topColer
        bgView.middleColor = minColer
        bgView.endColor = booColer
        return bgView
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.showsVerticalScrollIndicator = false
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedSectionHeaderHeight = 0;
        tableView.estimatedSectionFooterHeight = 0;
        tableView.contentInsetAdjustmentBehavior = .never
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(bgView)
        bgView.addSubview(tableView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        bgView.snp.makeConstraints { make in
            make.left.right.bottom.equalTo(self)
            make.height.equalTo(520.pix())
        }
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(bgView).inset(UIEdgeInsets(top: 0, left: 0, bottom: CGFloat(STATUSBAR_HIGH), right: 0))
        }
        bgView.roundCorners(corners: [.topLeft,.topRight], radius: 20.pix())
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modelArray?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65.pix()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50.pix()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headView = UIView()
        let nameLable = UILabel.createLabel(font: UIFont.systemFont(ofSize: 20.pix(), weight: .medium), textColor: .black, textAlignment: .left)
        nameLable.text = titleStr ?? ""
        headView.addSubview(nameLable)
        nameLable.snp.makeConstraints { make in
            make.left.equalTo(headView).offset(26.pix())
            make.centerY.equalTo(headView)
            make.right.equalTo(headView)
            make.height.equalTo(44.pix())
        }
        return headView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let InfoCellID = "InfoCellID"
        let cell = InfoCell(style: .subtitle, reuseIdentifier: InfoCellID)
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        cell.model = modelArray?[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as? InfoCell
        cell?.nameLabel.backgroundColor = UIColor("#BBD598")
        let model = modelArray?[indexPath.row]
        guard let model = model else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
            self.block!(cell!,model.conjured!,model.lives ?? "")
        }
    }
    
}
