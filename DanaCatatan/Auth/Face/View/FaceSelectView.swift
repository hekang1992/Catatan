//
//  FaceSelectView.swift
//  Catatan
//
//  Created by apple on 2024/3/6.
//

import UIKit
import BRPickerView

class FaceSelectView: UIView {

    var block1: ((String,String,String) -> Void)?
    
    var block2: (() -> Void)?
    
    var model: HoveredModel?
    
    let titleArray = ["Nama","Nomor KTP","Hari ulang tahun"]

    lazy var bgView: UIView = {
        let bgView = UIView()
        bgView.backgroundColor = UIColor("#F5F5F5")
        return bgView
    }()
    
    lazy var nameLable: UILabel = {
        let nameLable = UILabel.createLabel(font: UIFont.systemFont(ofSize: 16.pix(), weight: .regular), textColor: UIColor.black, textAlignment: .left)
        nameLable.numberOfLines = 0
        nameLable.text = "Harap konfirmasi informasi identitas Anda.Jika ada kesalahan, mohon diperbaiki."
        return nameLable
    }()
    
    lazy var bgImageView1: UIImageView = {
        let bgImageView = UIImageView()
        bgImageView.image = UIImage(named: "abc7")
        return bgImageView
    }()
    
    lazy var mainBtn1: UIButton = {
        let button = UIButton(type: .custom)
        button.addTarget(self, action: #selector(cameraClick), for: .touchUpInside)
        button.backgroundColor = UIColor("#BBD598")
        button.layer.cornerRadius = 22.pix()
        button.setTitle("Memotret", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16.pix(), weight: .medium)
        return button
    }()
    
    lazy var backBtn: UIButton = {
        let backBtn = UIButton(type: .custom)
        backBtn.setImage(UIImage.init(named: "abc9"), for: .normal)
        backBtn.addTarget(self, action: #selector(canClick), for: .touchUpInside)
        return backBtn
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.showsVerticalScrollIndicator = false
        tableView.estimatedSectionHeaderHeight = 0;
        tableView.estimatedSectionFooterHeight = 0;
        return tableView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(bgView)
        bgView.addSubview(tableView)
        bgView.addSubview(mainBtn1)
        bgView.addSubview(backBtn)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        bgView.snp.makeConstraints { make in
            make.left.right.bottom.equalTo(self)
            make.height.equalTo(620.pix())
        }
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(bgView).inset(UIEdgeInsets(top: 0, left: 28.pix(), bottom: 80.pix(), right: 28.pix()))
        }
        mainBtn1.snp.makeConstraints { make in
            make.top.equalTo(tableView.snp.bottom).offset(  5.pix())
            make.centerX.equalTo(bgView)
            make.left.equalTo(bgView).offset(16.pix())
            make.height.equalTo(56.pix())
        }
        backBtn.snp.makeConstraints { make in
            make.top.equalTo(bgView).offset(12.pix())
            make.right.equalTo(bgView).offset(-20.pix())
            make.size.equalTo(CGSize(width: 32.pix(), height: 32.pix()))
        }
        bgView.roundCorners(corners: [.topLeft,.topRight], radius: 20.pix())
    }
    
    @objc func cameraClick() {
        let indexPath0 = IndexPath(row: 0, section: 0)
        let indexPath1 = IndexPath(row: 1, section: 0)
        let indexPath2 = IndexPath(row: 2, section: 0)
        let cell0 = tableView.cellForRow(at: indexPath0) as? CommonCell
        let cell1 = tableView.cellForRow(at: indexPath1) as? CommonCell
        let cell2 = tableView.cellForRow(at: indexPath2) as? CommonCell
        let dateStr = cell2?.textField1.text ?? ""
        let timeArray = dateStr.components(separatedBy: "-")
        if timeArray.isEmpty == false {
            let day = timeArray[0]
            let mon = timeArray[1]
            let year = timeArray[2]
            self.block1!(cell0!.textField1.text!,cell1!.textField1.text!,String(format: "%@-%@-%@",year,mon,day))
        }
    }
    
    @objc func canClick() {
        self.block2!()
    }

}


extension FaceSelectView: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let commonCellID = "commonCellID"
        let cell = CommonCell(style: .subtitle, reuseIdentifier: commonCellID)
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        cell.nameLable.text = titleArray[indexPath.row]
        if indexPath.row == 0 {
            cell.textField1.text = model!.conjured
        }else if indexPath.row == 1 {
            cell.textField1.keyboardType = .numberPad
            cell.textField1.text = model!.pawed
        }else {
            cell.textField1.isEnabled = false
            cell.textField1.text = String(format: "%@-%@-%@", model!.square!,model!.ogling!,model!.buyers!)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 82.pix()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("indexPath>>>>>>>\(indexPath.row)")
        if indexPath.row == 2{
            let cell = tableView.cellForRow(at: indexPath) as? CommonCell
            self.pickDate(day:model!.square!, mon:model!.ogling!, year:model!.buyers!,cell:cell!)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 250.pix()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headView = UIView()
        headView.addSubview(nameLable)
        headView.addSubview(bgImageView1)
        nameLable.snp.makeConstraints { make in
            make.left.equalTo(headView)
            make.top.equalTo(headView).offset(20.pix())
            make.right.equalTo(headView)
            make.height.equalTo(44.pix())
        }
        bgImageView1.snp.makeConstraints { make in
            make.top.equalTo(nameLable.snp.bottom).offset(10.pix())
            make.left.equalTo(headView)
            make.height.equalTo(168.pix())
            make.centerX.equalTo(headView)
        }
        return headView
    }
    
    func pickDate(day: String, mon: String, year: String, cell: CommonCell) {
        let datePickerView = BRDatePickerView()
        datePickerView.pickerMode = .date
        datePickerView.selectDate = NSDate.br_setYear(Int(year)!, month: Int(mon)!, day: Int(day)!)
        datePickerView.minDate = NSDate.br_setYear(1900, month: 3, day: 12)
        datePickerView.maxDate = Date()
        datePickerView.resultBlock = { selectDate, selectValue in
            print("selectValue>>>>>\(selectValue ?? "")")
            let timeArray = selectValue!.components(separatedBy: "-")
            let year = timeArray[0]
            let mon = timeArray[1]
            let day = timeArray[2]
            cell.textField1.text = String(format: "%@-%@-%@",day,mon,year)
        }
        let customStyle = BRPickerStyle()
        customStyle.pickerColor = BR_RGB_HEX(0xd9dbdf, 1.0)
        customStyle.pickerTextColor = UIColor("#373E49")
        customStyle.separatorColor = UIColor("#373E49")
        datePickerView.pickerStyle = customStyle
        datePickerView.show()
    }
    
}
