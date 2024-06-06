//
//  AlertChartView.swift
//  Catatan
//
//  Created by apple on 2024/4/8.
//

import UIKit
import DGCharts

class AlertChartView: UIView {
    
    var block: (() -> Void)?
    
    lazy var bgView: UIView = {
        let bgView = UIView()
        bgView.backgroundColor = .white
        return bgView
    }()
    
    lazy var label: UILabel = {
        let label = UILabel.createLabel(font: UIFont(name: Futura_Bold, size: 18.pix())!, textColor: .black, textAlignment: .center)
        label.text = "Line Chart"
        return label
    }()
    
    lazy var btn: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setImage(UIImage(named: "cha3"), for: .normal)
        btn.addTarget(self, action: #selector(hideClick), for: .touchUpInside)
        return btn
    }()
    
    lazy var view1: UIView = {
        let view1 = UIView()
        view1.layer.cornerRadius = 10.pix()
        view1.backgroundColor = UIColor("#188DFF")
        return view1
    }()
    
    lazy var view2: UIView = {
        let view1 = UIView()
        view1.layer.cornerRadius = 10.pix()
        view1.backgroundColor = UIColor("#FB9A01")
        return view1
    }()
    
    lazy var view3: UIView = {
        let view1 = UIView()
        view1.layer.cornerRadius = 10.pix()
        view1.backgroundColor = UIColor("#B3EE4B")
        return view1
    }()
    
    lazy var view4: UIView = {
        let view1 = UIView()
        view1.layer.cornerRadius = 10.pix()
        view1.backgroundColor = UIColor("#364880")
        return view1
    }()
    
    lazy var label1: UILabel = {
        let label = UILabel.createLabel(font: UIFont(name: Futura_Medium, size: 15.pix())!, textColor: .black, textAlignment: .left)
        label.text = "Investment"
        return label
    }()
    
    lazy var label2: UILabel = {
        let label = UILabel.createLabel(font: UIFont(name: Futura_Medium, size: 15.pix())!, textColor: .black, textAlignment: .left)
        label.text = "Liabilities"
        return label
    }()
    
    lazy var label3: UILabel = {
        let label = UILabel.createLabel(font: UIFont(name: Futura_Medium, size: 15.pix())!, textColor: .black, textAlignment: .left)
        label.text = "Current Assets"
        return label
    }()
    
    lazy var label4: UILabel = {
        let label = UILabel.createLabel(font: UIFont(name: Futura_Medium, size: 15.pix())!, textColor: .black, textAlignment: .left)
        label.text = "Fixed Assets"
        return label
    }()
    
    lazy var label5: UILabel = {
        let label = UILabel.createLabel(font: UIFont(name: Futura_Bold, size: 15.pix())!, textColor: .black, textAlignment: .center)
        label.backgroundColor = UIColor("#F4F8EE")
        label.layer.cornerRadius = 14.pix()
        label.text = "x : Month"
        label.layer.masksToBounds = true
        return label
    }()
    
    lazy var label6: UILabel = {
        let label = UILabel.createLabel(font: UIFont(name: Futura_Bold, size: 15.pix())!, textColor: .black, textAlignment: .center)
        label.backgroundColor = UIColor("#F4F8EE")
        label.layer.cornerRadius = 14.pix()
        label.layer.masksToBounds = true
        label.text = "y : Amount"
        return label
    }()
    
    lazy var lineChartView: LineChartView = {
        let lineChartView = LineChartView()
        lineChartView.xAxis.spaceMin = 1
        lineChartView.xAxis.spaceMax = 1
        lineChartView.xAxis.axisMinimum = 0
        lineChartView.xAxis.labelPosition = .bottom
        lineChartView.xAxis.drawGridLinesEnabled = false
        lineChartView.leftAxis.drawGridLinesEnabled = false
        lineChartView.rightAxis.drawGridLinesEnabled = false
        lineChartView.rightAxis.drawLabelsEnabled = false
        lineChartView.rightAxis.drawAxisLineEnabled = false
        lineChartView.legend.enabled = false
        lineChartView.leftAxis.axisMinimum = 0
        lineChartView.translatesAutoresizingMaskIntoConstraints = false
        return lineChartView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(bgView)
        bgView.addSubview(label)
        bgView.addSubview(btn)
        bgView.addSubview(view1)
        bgView.addSubview(view2)
        bgView.addSubview(view3)
        bgView.addSubview(view4)
        bgView.addSubview(label1)
        bgView.addSubview(label2)
        bgView.addSubview(label3)
        bgView.addSubview(label4)
        bgView.addSubview(label5)
        bgView.addSubview(label6)
        bgView.addSubview(lineChartView)
        bgView.snp.makeConstraints { make in
            make.left.right.bottom.equalTo(self)
            make.height.equalTo(590.pix())
        }
        label.snp.makeConstraints { make in
            make.centerX.equalTo(bgView)
            make.top.equalTo(bgView).offset(18.pix())
            make.height.equalTo(24.pix())
        }
        btn.snp.makeConstraints { make in
            make.right.equalTo(bgView).offset(-5.pix())
            make.top.equalTo(bgView)
            make.size.equalTo(CGSize(width: 60.pix(), height: 60.pix()))
        }
        view1.snp.makeConstraints { make in
            make.top.equalTo(bgView).offset(66.pix())
            make.left.equalTo(bgView).offset(46.pix())
            make.size.equalTo(CGSize(width: 20.pix(), height: 20.pix()))
        }
        label1.snp.makeConstraints { make in
            make.left.equalTo(view1.snp.right).offset(6.pix())
            make.top.equalTo(bgView).offset(63.pix())
            make.height.equalTo(25.pix())
        }
        view2.snp.makeConstraints { make in
            make.top.equalTo(view1.snp.bottom).offset(12.pix())
            make.left.equalTo(bgView).offset(46.pix())
            make.size.equalTo(CGSize(width: 20.pix(), height: 20.pix()))
        }
        label2.snp.makeConstraints { make in
            make.left.equalTo(view1.snp.right).offset(6.pix())
            make.top.equalTo(label1.snp.bottom).offset(7.pix())
            make.height.equalTo(25.pix())
        }
        view3.snp.makeConstraints { make in
            make.top.equalTo(view2.snp.bottom).offset(12.pix())
            make.left.equalTo(bgView).offset(46.pix())
            make.size.equalTo(CGSize(width: 20.pix(), height: 20.pix()))
        }
        label3.snp.makeConstraints { make in
            make.left.equalTo(view1.snp.right).offset(6.pix())
            make.top.equalTo(label2.snp.bottom).offset(7.pix())
            make.height.equalTo(25.pix())
        }
        view4.snp.makeConstraints { make in
            make.top.equalTo(view3.snp.bottom).offset(12.pix())
            make.left.equalTo(bgView).offset(46.pix())
            make.size.equalTo(CGSize(width: 20.pix(), height: 20.pix()))
        }
        label4.snp.makeConstraints { make in
            make.left.equalTo(view1.snp.right).offset(6.pix())
            make.top.equalTo(label3.snp.bottom).offset(7.pix())
            make.height.equalTo(25.pix())
        }
        label5.snp.makeConstraints { make in
            make.right.equalTo(bgView).offset(-43.pix())
            make.top.equalTo(bgView).offset(72.pix())
            make.width.equalTo(108.pix())
            make.height.equalTo(28.pix())
        }
        label6.snp.makeConstraints { make in
            make.left.equalTo(label5.snp.left)
            make.top.equalTo(label5.snp.bottom).offset(10.pix())
            make.width.equalTo(120.pix())
            make.height.equalTo(28.pix())
        }
        lineChartView.snp.makeConstraints { make in
            make.centerX.equalTo(bgView)
            make.left.equalTo(bgView).offset(20.pix())
            make.top.equalTo(label4.snp.bottom).offset(25.pix())
            make.height.equalTo(266.pix())
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        bgView.roundCorners(corners: [.topLeft,.topRight], radius: 20.pix())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func hideClick() {
        self.block!()
    }
}
