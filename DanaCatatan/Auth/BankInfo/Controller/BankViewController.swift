//
//  BankViewController.swift
//  Catatan
//
//  Created by apple on 2024/2/29.
//

import UIKit
import HandyJSON
import MBProgressHUD_WJExtension

class BankViewController: BaseViewController {
    
    var bidders: String = ""
    
    var hardworking: String = ""
    
    var startTime1: String = ""
    
    lazy var bankView: BankView = {
        let bankView = BankView()
        return bankView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        addNavView()
        navView.block = { [weak self] in
            self?.wanLiuAuthView("Apakah Anda yakin ingin menyerah pada permohonan pinjaman ini?")
        }
        view.addSubview(bankView)
        view.insertSubview(bankView, belowSubview: navView)
        bankView.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }
        bankView.block = { [weak self] dict in
            dict["bidders"] = self?.bidders
            print("dict>>参数>>\(dict)")
            self?.saveInfo(dict: dict)
        }
        getBankInfo()
        startTime1 = String(Int(Date().timeIntervalSince1970))
    }
    
    func getBankInfo() {
        addHudView()
        let dict = ["bidders":bidders]
        NetApiWork.shared.requestAPI(params: dict, pageUrl: anythingAbundance, method: .post) { [weak self] baseModel in
            let awess = baseModel.awareness
            let edges = baseModel.edges
            if awess == 0 || awess == 00 {
                let model = JSONDeserializer<HoveredModel>.deserializeFrom(dict: baseModel.hovered)
                let craved = model?.craved
                if let craved = craved {
                    self?.bankView.array = craved
                    self?.bankView.tableView.reloadData()
                }
            }
            self?.removeHudView()
            MBProgressHUD.wj_showPlainText(edges ?? "", view: nil)
        } errorBlock: { [weak self] error in
            self?.removeHudView()
        }
    }
    
    func saveInfo(dict: [String: Any]) {
        addHudView()
        NetApiWork.shared.requestAPI(params: dict, pageUrl: shinesHollowness, method: .post) { [weak self] baseModel in
            let awess = baseModel.awareness
            let edges = baseModel.edges
            if awess == 0 || awess == 00 {
                self?.maidian(productID: self?.bidders ?? "", startTime: self?.startTime1 ?? "", type: "9", orderID: self?.hardworking ?? "")
                self?.getProductDetailInfo(self?.bidders ?? "", "", "bank")
                self?.delay(0.5) {
                    self?.maidian(productID: self?.bidders ?? "", startTime: String(Int(Date().timeIntervalSince1970)), type: "10", orderID: self?.hardworking ?? "")
                }
            }
            self?.removeHudView()
            MBProgressHUD.wj_showPlainText(edges ?? "", view: nil)
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
