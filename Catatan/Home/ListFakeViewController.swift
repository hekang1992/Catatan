//
//  ListFakeViewController.swift
//  Catatan
//
//  Created by apple on 2024/3/27.
//

import UIKit

class ListFakeViewController: BaseViewController {
    
    var titleStr: String?
    
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
        if let str = titleStr {
            if str.contains("Other") {
                navView.nameLabel.text = "Other"
            }else {
                navView.nameLabel.text = titleStr
            }
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
