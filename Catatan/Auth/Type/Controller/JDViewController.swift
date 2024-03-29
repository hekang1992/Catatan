//
//  JDViewController.swift
//  Catatan
//
//  Created by apple on 2024/2/29.
//

import UIKit
import HandyJSON

class JDViewController: BaseViewController {
    
    var bidders: String = ""
    
    var picture: String = ""
    
    var hardworking: String = ""

    lazy var jdView: JDView = {
        let jdView = JDView()
        return jdView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.addSubview(jdView)
        jdView.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }
        
        jdView.block = {[weak self] in
            self?.navigationController?.popViewController(animated: true)
        }

        jdView.block1 = { [weak self] in
            self?.nextVc()
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getProductDetailInfo()
    }
    
    func getProductDetailInfo() {
        let dict = ["bidders":bidders]
        addHudView()
        NetApiWork.shared.requestAPI(params: dict as [String : Any], pageUrl: fieldQuite, method: .post) { [weak self] baseModel in
            let hovered = baseModel.hovered
            let awareness = baseModel.awareness
            if awareness == 0 || awareness == 00 {
                let model = JSONDeserializer<HoveredModel>.deserializeFrom(dict: hovered)
                let picture = model?.circumstance?.picture
                let hardworking = model?.blouses?.hardworking
                self?.stateInfo(picture ?? "")
                self?.picture = picture ?? ""
                self?.hardworking = hardworking ?? ""
            }
            self?.removeHudView()
        } errorBlock: { [weak self] error in
            self?.removeHudView()
        }
    }
    
    func stateInfo(_ type: String) {
        if type == "dcan1" {
            jdView.typeImageView.currentState = .dcan1
        }else if type == "dcan2" {
            jdView.typeImageView.currentState = .dcan2
        }else if type == "dcan3" {
            jdView.typeImageView.currentState = .dcan3
        }else if type == "dcan4" {
            jdView.typeImageView.currentState = .dcan4
        }else{}
    }
    
    func nextVc() {
        if self.picture == "dcan1" {
            let photoVc = FaceViewController()
            photoVc.bidders = bidders
            photoVc.hardworking = hardworking
            getVc(photoVc)
        }else if self.picture == "dcan2" {
            let personVc = PersonalViewController()
            personVc.bidders = bidders
            getVc(personVc)
        }else if self.picture == "dcan3" {
            let conVc = ContractViewController()
            conVc.bidders = bidders
            getVc(conVc)
        }else if self.picture == "dcan4" {
            let bankVc = BankViewController()
            bankVc.bidders = bidders
            getVc(bankVc)
        }else{}
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
