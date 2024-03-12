//
//  PersonalViewController.swift
//  Catatan
//
//  Created by apple on 2024/2/29.
//

import UIKit
import HandyJSON
import MBProgressHUD_WJExtension

class PersonalViewController: BaseViewController {
    
    var bidders: String = ""
    
    lazy var personView: PersonalView = {
        let personView = PersonalView()
        return personView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        addNavView()
        navView.block = { [weak self] in
            self?.popToSpecificViewController()
        }
        view.addSubview(personView)
        view.insertSubview(personView, belowSubview: navView)
        personView.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }
        personView.block = { [weak self] dict in
            dict["bidders"] = self?.bidders
            print("dict>>参数>>\(dict)")
            self?.saveInfo(dict: dict)
        }
        getCityInfo()
        getPeopleInfo()
    }
    
    func getPeopleInfo() {
        addHudView()
        let dict = ["bidders":bidders]
        NetApiWork.shared.requestAPI(params: dict, pageUrl: boundAfter, method: .post) { [weak self] baseModel in
            let awareness = baseModel.awareness
            let edges = baseModel.edges
            if awareness == 0 || awareness == 00 {
                let model = JSONDeserializer<HoveredModel>.deserializeFrom(dict: baseModel.hovered)
                let craved = model?.craved
                if let craved = craved {
                    self?.personView.array = craved
                    self?.personView.tableView.reloadData()
                }
            }
            self?.removeHudView()
            MBProgressHUD.wj_showPlainText(edges ?? "", view: nil)
        } errorBlock: { [weak self] error in
            self?.removeHudView()
        }
    }
    
    func getCityInfo() {
        NetApiWork.shared.requestAPI(params: [:], pageUrl: ricketySeason, method: .get) { baseModel in
            let awareness = baseModel.awareness
            if awareness == 0 || awareness == 00 {
                let model = JSONDeserializer<HoveredModel>.deserializeFrom(dict: baseModel.hovered)
                if let model = model {
                    self.personView.cityArray = model.incomes!
                }
            }
        } errorBlock: { error in
            
        }
    }
    
    func saveInfo(dict: [String: Any]) {
        addHudView()
        NetApiWork.shared.requestAPI(params: dict, pageUrl: rabbitThere, method: .post) { [weak self] baseModel in
            let awareness = baseModel.awareness
            let edges = baseModel.edges
            if awareness == 0 || awareness == 00 {
                self?.getProductDetailInfo(self?.bidders ?? "", "")
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
