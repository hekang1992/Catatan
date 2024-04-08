//
//  PopCityView.swift
//  Catatan
//
//  Created by apple on 2024/3/8.
//

import UIKit
import JXGradientKit

class PopCityView: UIView, UIPickerViewDelegate,UIPickerViewDataSource {
    
    var block1: (() -> Void)?
    
    var block2: ((String) -> Void)?
    
    var array: [IncomesModel]?{
        didSet {
            let model1 = array?[0]
            let model2 = array?[0].bandanas?[0]
            let model3 = array?[0].bandanas?[0].bandanas?[0]
            label2.text = model1?.conjured ?? ""
            label3.text = model2?.conjured ?? ""
            label4.text = model3?.conjured ?? ""
        }
    }
    
    var provicerow: Int = 0
    
    var cityrow: Int = 0
    
    var qurow: Int = 0
    
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
    
    lazy var btn1: UIButton = {
        let btn1 = UIButton(type: .custom)
        btn1.setTitle("Batal", for: .normal)
        btn1.setTitleColor(.black, for: .normal)
        btn1.titleLabel?.font = UIFont.systemFont(ofSize: 16.pix(), weight: .regular)
        btn1.addTarget(self, action: #selector(canClick), for: .touchUpInside)
        return btn1
    }()
    
    lazy var label1: UILabel = {
        let label1 = UILabel.createLabel(font: UIFont.systemFont(ofSize: 20.pix(), weight: .medium), textColor: .black, textAlignment: .center)
        label1.text = "Pilih Alamat"
        return label1
    }()
    
    lazy var btn2: UIButton = {
        let btn2 = UIButton(type: .custom)
        btn2.setTitle("Konfirmasi", for: .normal)
        btn2.setTitleColor(.black, for: .normal)
        btn2.titleLabel?.font = UIFont.systemFont(ofSize: 16.pix(), weight: .regular)
        btn2.addTarget(self, action: #selector(sureClick), for: .touchUpInside)
        return btn2
    }()
    
    lazy var pickerView: UIPickerView = {
        let picker = UIPickerView()
        picker.delegate = self
        picker.dataSource = self
        return picker
    }()
    
    lazy var label2: UILabel = {
        let label1 = UILabel.createLabel(font: UIFont.systemFont(ofSize: 18.pix(), weight: .regular), textColor: UIColor("#BBD598"), textAlignment: .left)
        label1.text = "123"
        return label1
    }()
    
    lazy var label3: UILabel = {
        let label1 = UILabel.createLabel(font: UIFont.systemFont(ofSize: 18.pix(), weight: .regular), textColor: UIColor("#BBD598"), textAlignment: .center)
        label1.text = "456"
        return label1
    }()
    
    lazy var label4: UILabel = {
        let label1 = UILabel.createLabel(font: UIFont.systemFont(ofSize: 18.pix(), weight: .regular), textColor: UIColor("#BBD598"), textAlignment: .left)
        label1.text = "789"
        return label1
    }()
    
    lazy var iconImageView1: UIImageView = {
        let iconImageView = UIImageView()
        iconImageView.image = UIImage(named: "abc17")
        return iconImageView
    }()
    
    lazy var iconImageView2: UIImageView = {
        let iconImageView = UIImageView()
        iconImageView.image = UIImage(named: "abc17")
        return iconImageView
    }()
    
    lazy var lineView: UIView = {
        let lineView = UIView()
        lineView.alpha = 0.8
        lineView.backgroundColor = UIColor(TITLE_COLOR)
        return lineView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(bgView)
        bgView.addSubview(btn1)
        bgView.addSubview(label1)
        bgView.addSubview(btn2)
        bgView.addSubview(pickerView)
        bgView.addSubview(label2)
        bgView.addSubview(label3)
        bgView.addSubview(label4)
        bgView.addSubview(lineView)
        bgView.addSubview(iconImageView1)
        bgView.addSubview(iconImageView2)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        bgView.snp.makeConstraints { make in
            make.left.right.bottom.equalTo(self)
            make.height.equalTo(480.pix())
        }
        btn1.snp.makeConstraints { make in
            make.top.equalTo(bgView).offset(30.pix())
            make.left.equalTo(bgView).offset(20.pix())
            make.size.equalTo(CGSize(width: 50.pix(), height: 25.pix()))
        }
        label1.snp.makeConstraints { make in
            make.top.equalTo(bgView).offset(28.pix())
            make.centerX.equalTo(bgView)
            make.size.equalTo(CGSize(width: 120.pix(), height: 28.pix()))
        }
        btn2.snp.makeConstraints { make in
            make.top.equalTo(bgView).offset(30.pix())
            make.right.equalTo(bgView).offset(-20.pix())
            make.size.equalTo(CGSize(width: 100.pix(), height: 25.pix()))
        }
        label2.snp.makeConstraints { make in
            make.top.equalTo(btn2.snp.bottom).offset(30.pix())
            make.left.equalTo(bgView).offset(20.pix())
            make.width.equalTo(80.pix())
        }
        iconImageView1.snp.makeConstraints { make in
            make.top.equalTo(bgView).offset(93.pix())
            make.left.equalTo(label2.snp.right).offset(20.pix())
            make.size.equalTo(CGSize(width: 7.pix(), height: 11.pix()))
        }
        label3.snp.makeConstraints { make in
            make.top.equalTo(btn2.snp.bottom).offset(30.pix())
            make.left.equalTo(iconImageView1.snp.right).offset(20.pix())
            make.width.equalTo(80.pix())
        }
        iconImageView2.snp.makeConstraints { make in
            make.top.equalTo(bgView).offset(93.pix())
            make.left.equalTo(label3.snp.right).offset(20.pix())
            make.size.equalTo(CGSize(width: 7.pix(), height: 11.pix()))
        }
        label4.snp.makeConstraints { make in
            make.top.equalTo(btn2.snp.bottom).offset(30.pix())
            make.left.equalTo(iconImageView2.snp.right).offset(20.pix())
            make.width.equalTo(80.pix())
        }
        lineView.snp.makeConstraints { make in
            make.top.equalTo(bgView).offset(123.pix())
            make.centerX.equalTo(bgView)
            make.left.equalTo(bgView).offset(20.pix())
            make.height.equalTo(1.pix())
        }
        pickerView.snp.makeConstraints { make in
            make.left.equalTo(bgView)
            make.top.equalTo(bgView).offset(133)
            make.centerX.equalTo(bgView)
            make.height.equalTo(300.pix())
        }
        bgView.roundCorners(corners: [.topLeft,.topRight], radius: 20.pix())
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return array?.count ?? 0
        }else if component == 1 {
            let modelArray = array?[provicerow].bandanas
            return modelArray?.count ?? 0
        }else{
            let modelArray = array?[provicerow].bandanas?[cityrow].bandanas
            return modelArray?.count ?? 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            let model = array?[row]
            return model?.conjured
        }else if component == 1 {
            let modelArray = array?[provicerow].bandanas
            let model = modelArray?[row]
            return model?.conjured
        }else{
            let modelArray = array?[provicerow].bandanas?[cityrow].bandanas
            let model = modelArray?[row]
            return model?.conjured
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0 {
            provicerow = row;
            cityrow = 0;
            qurow = 0;
            pickerView.selectRow(0, inComponent: 1, animated: false)
            pickerView.selectRow(0, inComponent: 2, animated: false)
            pickerView.reloadComponent(1)
            pickerView.reloadComponent(2)
            let model = array?[row]
            let modelArray = array?[provicerow].bandanas
            let model1 = modelArray?[0]
            let modelArray2 = array?[provicerow].bandanas?[cityrow].bandanas
            let model2 = modelArray2?[0]
            label2.text = model?.conjured
            label3.text = model1?.conjured
            label4.text = model2?.conjured
        }else if component == 1 {
            cityrow = row;
            qurow = 0;
            pickerView.selectRow(0, inComponent: 2, animated: false)
            pickerView.reloadComponent(2)
            let modelArray = array?[provicerow].bandanas
            let model = modelArray?[0]
            let modelArray2 = array?[provicerow].bandanas?[cityrow].bandanas
            let model2 = modelArray2?[row]
            label3.text = model?.conjured
            label4.text = model2?.conjured
        }else {
            qurow = row
            let modelArray = array?[provicerow].bandanas?[cityrow].bandanas
            let model = modelArray?[row]
            label4.text = model?.conjured
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var testLabel: UILabel!
        if let label = view as? UILabel {
            testLabel = label
        } else {
            testLabel = UILabel()
            testLabel.font = UIFont.systemFont(ofSize: 16.pix(), weight: .regular)
            testLabel.textColor = .black
            testLabel.textAlignment = .center
            testLabel.numberOfLines = 0
            testLabel.backgroundColor = .clear
        }
        testLabel.text = pickerView.delegate?.pickerView?(pickerView, titleForRow: row, forComponent: component)
        return testLabel
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 45.pix()
    }
    
    @objc func canClick() {
        self.block1!()
    }
    
    @objc func sureClick() {
        let cityStr = String(format: "%@-%@-%@",label2.text ?? "", label3.text ?? "", label4.text ?? "")
        self.block2!(cityStr)
    }
    
}
