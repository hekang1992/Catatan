//
//  FuDaiViewController.swift
//  DanaCatatan
//
//  Created by apple on 2024/4/9.
//

import UIKit
import HandyJSON

class FuDaiViewController: BaseViewController {
    
    lazy var fuView: FuDaiTableView = {
        let fuView = FuDaiTableView()
        return fuView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        addNavView()
        navView.nameLabel.text = "Daftar Rekomendasi"
        navView.block = { [weak self] in
            self?.navigationController?.popViewController(animated: true)
        }
        view.addSubview(fuView)
        fuView.snp.makeConstraints { make in
            make.bottom.leading.right.equalTo(self.view)
            make.top.equalTo(navView.snp.bottom)
        }
        fuView.block = { [weak self] str in
            self?.applyClick(Int(str) ?? 0)
        }
    }
    
    func applyClick(_ index: NSInteger){
        addHudView()
        let dict = ["bidders":index]
        NetApiWork.shared.requestAPI(params: dict, pageUrl: thoseWater, method: .post) { [weak self] baseModel in
            let awess = baseModel.awareness
            if awess == 0 || awess == 00 {
                let dict = baseModel.hovered
                let applyModel = JSONDeserializer<HoveredModel>.deserializeFrom(dict: dict)
                let url = applyModel?.occurred
                guard let url = url else { return }
                print("url>>跳转>>\(url)")
                if url.contains(SCHEME_URL) {
                    self?.getProductDetailInfo(String(index),url,"")
                }else{
                    self?.pushWebVC(url,"")
                }
            }
            self?.removeHudView()
        } errorBlock: { [weak self] error in
            self?.removeHudView()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addHudView()
        NetApiWork.shared.requestAPI(params: [:], pageUrl: stretchHuman, method: .post) { [weak self] baseModel in
            let awess = baseModel.awareness
            if awess == 0 || awess == 00 {
                let hovered = baseModel.hovered
                let modelArray = JSONDeserializer<HoveredModel>.deserializeFrom(dict: hovered)
                if modelArray?.incomes?.count == 0 {
                    self?.addEmptyView()
                }else {
                    self?.fuView.array = modelArray?.incomes ?? []
                    self?.removeEmptyView()
                }
            }
            self?.removeHudView()
            self?.fuView.tableView.reloadData()
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
