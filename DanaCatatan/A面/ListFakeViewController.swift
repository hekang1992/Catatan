//
//  ListFakeViewController.swift
//  Catatan
//
//  Created by apple on 2024/3/27.
//

import UIKit

class ListFakeViewController: BaseViewController {
    
    var titleStr: String = ""
    
    var index: Int?
    
    var model: IncomesModel?
    
    lazy var bgView1: UIView = {
        let bgView = UIView()
        bgView.backgroundColor = UIColor("#FFFFFF")
        return bgView
    }()
    
    lazy var listView: ListView = {
        let listView = ListView()
        return listView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        addNavView()
        if titleStr.contains("Other") {
            navView.nameLabel.text = "Other"
        }else {
            navView.nameLabel.text = titleStr
        }
        navView.block = { [weak self] in
            self?.navigationController?.popViewController(animated: true)
        }
        view.insertSubview(bgView1, belowSubview: navView)
        bgView1.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }
        bgView1.addSubview(listView)
        listView.snp.makeConstraints { make in
            make.edges.equalTo(bgView1).inset(UIEdgeInsets(top: CGFloat(NAV_HIGH), left: 0, bottom: 0, right: 0))
        }
        listView.model = model
        if titleStr == "Fund" || titleStr == "Bank Wealth" || titleStr == "Insurance" || titleStr == "Other1"  {
            listView.currentState = .fund1
            listView.typeStr = titleStr
        }else if titleStr == "Credit Card" {
            listView.currentState = .card1
            listView.typeStr = titleStr
        }else if titleStr == "Loan" || titleStr == "Payment" || titleStr == "Other3" {
            listView.currentState = .card2
            listView.typeStr = titleStr
        }else if titleStr == "Cash" || titleStr == "Other2" {
            listView.currentState = .cash1
            listView.typeStr = titleStr
        }else if titleStr == "Debit Card" || titleStr == "Credit Limit" {
            listView.currentState = .cash2
            listView.typeStr = titleStr
        }else {
            listView.currentState = .car1
            listView.typeStr = titleStr
        }
        listView.dictBlock = { [weak self] dict in
            print("dict>>>>>>>>>>\(dict)")
            if self?.model?.enfolding == nil {
                self?.noOrderID(dict)
            }else {
                self?.haveOrderID(dict)
            }
        }
    }
    
    //添加投资
    func noOrderID(_ dict: [String: Any]) {
        var adcDict: [String: Any] = [:]
        if titleStr == "Fund" {
            adcDict["school"] = "1"
            adcDict["flying"] = "1"
        }
        if titleStr == "Bank Wealth" {
            adcDict["school"] = "1"
            adcDict["flying"] = "2"
        }
        if titleStr == "Insurance" {
            adcDict["school"] = "1"
            adcDict["flying"] = "3"
        }
        if titleStr == "Other1" {
            adcDict["school"] = "1"
            adcDict["flying"] = "4"
        }
        if titleStr == "Credit Card" {
            adcDict["school"] = "2"
            adcDict["flying"] = "1"
        }
        if titleStr == "Loan" {
            adcDict["school"] = "2"
            adcDict["flying"] = "2"
        }
        if titleStr == "Payment" {
            adcDict["school"] = "2"
            adcDict["flying"] = "3"
        }
        if titleStr == "Other2" {
            adcDict["school"] = "3"
            adcDict["flying"] = "4"
        }
        if titleStr == "Cash" {
            adcDict["school"] = "3"
            adcDict["flying"] = "1"
        }
        if titleStr == "Debit Card" {
            adcDict["school"] = "3"
            adcDict["flying"] = "2"
        }
        if titleStr == "Credit Limit" {
            adcDict["school"] = "3"
            adcDict["flying"] = "3"
        }
        if titleStr == "Other3" {
            adcDict["school"] = "2"
            adcDict["flying"] = "4"
        }
        if titleStr == "Car" {
            adcDict["school"] = "4"
            adcDict["flying"] = "1"
        }
        if titleStr == "House" {
            adcDict["school"] = "4"
            adcDict["flying"] = "2"
        }
        if titleStr == "Equipment" {
            adcDict["school"] = "4"
            adcDict["flying"] = "3"
        }
        if titleStr == "Other4" {
            adcDict["school"] = "4"
            adcDict["flying"] = "4"
        }
        adcDict.merge(dict) { (_, new) in new }
        addHudView()
        NetApiWork.shared.requestAPI(params: adcDict, pageUrl: lingerKnapsack, method: .post) { [weak self] baseModel in
            let awess = baseModel.awareness
            if awess == 0 || awess == 00 {
                self?.navigationController?.popToRootViewController(animated: true)
            }
            self?.removeHudView()
        } errorBlock: { [weak self] error in
            self?.removeHudView()
        }
        
    }
    
    //编辑投资
    func haveOrderID(_ dict: [String: Any]) {
        addHudView()
        var adcDict: [String: Any] = [:]
        adcDict["school"] = model?.school
        adcDict["flying"] = model?.flying
        adcDict["scars"] = model?.enfolding
        adcDict.merge(dict) { (_, new) in new }
        NetApiWork.shared.requestAPI(params: adcDict, pageUrl: localsAfter, method: .post) { [weak self] baseModel in
            let awess = baseModel.awareness
            if awess == 0 || awess == 00 {
                self?.navigationController?.popToRootViewController(animated: true)
            }
            self?.removeHudView()
        } errorBlock: { [weak self] error in
            self?.removeHudView()
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
