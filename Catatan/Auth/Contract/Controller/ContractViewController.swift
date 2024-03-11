//
//  ContractViewController.swift
//  Catatan
//
//  Created by apple on 2024/2/29.
//

import UIKit
import HandyJSON
import MBProgressHUD_WJExtension
import Contacts

class ContractViewController: BaseViewController {
    
    var bidders: String = ""
    
    lazy var contractView: ContractView = {
        let contractView = ContractView()
        return contractView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        addNavView()
        navView.block = { [weak self] in
            self?.popToSpecificViewController()
        }
        view.addSubview(contractView)
        view.insertSubview(contractView, belowSubview: navView)
        contractView.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }
        getContractInfo()
    }
    
    func getContractInfo() {
        addHudView()
        let dict = ["bidders":bidders]
        NetApiWork.shared.requestAPI(params: dict, pageUrl: tarzanDamned, method: .post) { [weak self] baseModel in
            let awareness = baseModel.awareness
            let edges = baseModel.edges
            if awareness == 0 || awareness == 00 {
                let model = JSONDeserializer<HoveredModel>.deserializeFrom(dict: baseModel.hovered)
                let incomes = model?.released?.incomes
                if let incomes = incomes {
                    self?.contractView.array = incomes
                    self?.contractView.tableView.reloadData()
                }
            }
            self?.removeHudView()
            MBProgressHUD.wj_showPlainText(edges ?? "", view: nil)
        } errorBlock: { [weak self] error in
            self?.removeHudView()
        }
    }
    
    func getContractPeInfo() {
        let allContacts = ContactsManager.getAllContacts()
        print("allContacts>>>>>>\(allContacts)")
    }
    
}
