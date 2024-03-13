//
//  HomeViewController.swift
//  Catatan
//
//  Created by apple on 2024/2/26.
//

import UIKit
import DeviceKit
import MJRefresh
import HandyJSON
import RxSwift

class HomeViewController: BaseViewController {
    
    var largeDataModel: [DrawingModel] = []
    
    private var locationManager: LocationManager?
    
    var startTimeStr: String?
    
    let bag = DisposeBag()
    
    var obs: PublishSubject<LocationModel?> = PublishSubject()
    
    lazy var homeOneView: HomeOneView = {
        let homeOneView = HomeOneView()
        return homeOneView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        view.addSubview(homeOneView)
        homeOneView.snp.makeConstraints { make in
            make.edges.equalTo(view).inset(UIEdgeInsets(top: 0, left: 0, bottom: TabBarHeight, right: 0))
        }
        let token: String = USER_DEFAULTS.object(forKey: LOGIN_SEIZES) as? String ?? ""
        if token.isEmpty == false {
            locationInfo()
        }
        homeOneView.blcok = { [weak self] index,title in
            self?.applyClick(index)
        }
        homeOneView.tableView.mj_header = MJRefreshNormalHeader(refreshingTarget: self, refreshingAction: #selector(loadNewData))
        homeOneView.tableView.mj_header?.isAutomaticallyChangeAlpha = true
        obs.debounce(.milliseconds(2000), scheduler: MainScheduler.asyncInstance)
            .subscribe(onNext: { [weak self] model in
                if let model = model {
                    self?.upLocationInfo(model)
                }
            }).disposed(by: bag)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getHomeData()
        self.showTabBar()
        startTimeStr = String(Date().timeIntervalSince1970)
    }
    
    func locationInfo() {
        LocationManager.shared.startUpdatingLocation { [weak self] locationModel in
            print("国家>>>：\(locationModel.country ?? "")")
            print("国家代码>>>：\(locationModel.countryCode ?? "")")
            print("省>>>：\(locationModel.province ?? "")")
            print("市>>>：\(locationModel.city ?? "")")
            print("区>>>：\(locationModel.district ?? "")")
            print("街道>>>：\(locationModel.street ?? "")")
            print("经度>>>：\(locationModel.excellent ?? 0.0)")
            print("纬度>>>：\(locationModel.carpenter ?? 0.0)")
            //            self?.upLocationInfo(locationModel)
            self?.obs.onNext(locationModel)
        }
    }
    
    func upLocationInfo(_ locationModel: LocationModel) {
        let dict = ["stephen":locationModel.country ,"laborer":locationModel.countryCode,"description":locationModel.province,"joseph":locationModel.city,"moses":locationModel.district,"james":locationModel.street,"excellent":locationModel.excellent,"carpenter":locationModel.carpenter] as [String : Any?]
        NetApiWork.shared.requestAPI(params: dict as [String : Any], pageUrl: mastersThough, method: .post) { [weak self] model in
            let awareness = model.awareness
            if awareness == 0 || awareness == 00 {
                print("location>>>>>>success")
                self?.baseDictToBase64()
            }
        } errorBlock: { error in
            
        }
    }
    
    func baseDictToBase64() {
        let dict: [String: Any] = DeviceInfo.deviceDictInfo()
        if let base64String = convertDictToBase64(dict) {
            self.uploadDeviceInfo(base64String)
            self.maidian1()
        } else {
            print("Failed to convert dictionary to base64")
        }
    }
    
    func convertDictToBase64(_ dict: [String: Any]) -> String? {
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: dict)
            let base64EncodedString = jsonData.base64EncodedString()
            return base64EncodedString
        } catch {
            print("Error: \(error)")
            return nil
        }
    }
    
    func uploadDeviceInfo(_ baseStr: String) {
        let dict = ["hovered": baseStr]
        NetApiWork.shared.requestAPI(params: dict as [String : Any], pageUrl: protestedPiteously, method: .post) { model in
            let awareness = model.awareness
            if awareness == 0 || awareness == 00 {
                print("uploadDeviceInfo>>>>>>success")
            }
        } errorBlock: { error in
            
        }
    }
    
    @objc func loadNewData() {
        getHomeData()
    }
    
    func getHomeData() {
        addHudView()
        let dict: [String: Any] = [:]
        NetApiWork.shared.requestAPI(params: dict, pageUrl: leatherScratched, method: .get) { [weak self] model in
            let awareness = model.awareness
            if awareness == 0 || awareness == 00 {
                let dict = model.hovered
                let inModel = JSONDeserializer<HoveredModel>.deserializeFrom(dict: dict)
                if let inModel = inModel {
                    if inModel.lives == "nn" {
                        self?.largeDataModel = inModel.incomes?.filter{ $0.lives == "nn" }.compactMap{ $0.drawing }.first ?? []
                        print("largeDataModel>>>>>\(self?.largeDataModel ?? [])")
                    }
                }
            }
            self?.removeHudView()
            self?.homeOneView.tableView.mj_header?.endRefreshing()
        } errorBlock: { [weak self] error in
            self?.removeHudView()
            self?.homeOneView.tableView.mj_header?.endRefreshing()
        }
    }
    
    func applyClick(_ index: NSInteger){
        addHudView()
        guard let model = self.largeDataModel.first else { return }
        print("applyClick>>>>>\(model.tradition ?? "")")
        let bidders = model.tradition ?? ""
        let dict = ["bidders":bidders]
        NetApiWork.shared.requestAPI(params: dict, pageUrl: thoseWater, method: .post) { [weak self] baseModel in
            let awareness = baseModel.awareness
            if awareness == 0 || awareness == 00 {
                let dict = baseModel.hovered
                let applyModel = JSONDeserializer<HoveredModel>.deserializeFrom(dict: dict)
                let url = applyModel?.occurred
                guard let url = url else { return }
                print("url>>跳转>>\(url)")
                if url.contains("app.dcatan/terrainShoot") {
                    self?.getProductDetailInfo(bidders,url)
                }else{
                    //跳转webview
                    self?.pushWebVC(url)
                }
            }
            self?.removeHudView()
        } errorBlock: { [weak self] error in
            self?.removeHudView()
        }
    }
    
    func maidian1() {
        let type = USER_DEFAULTS.object(forKey: MAIDIAN_ONE) as? String ?? ""
        if type != "1" {
            let model = LocationManager.shared.locatinModel
            let target = ""
            let possum = "1"
            let hardworking = ""
            let visits = DeviceInfo.finely()
            let wrath = DeviceInfo.stroll()
            let excellent = model.excellent
            let carpenter = model.carpenter
            let parents = startTimeStr
            let confide = String(Date().timeIntervalSince1970)
            print("maidian1>>>>参数>>>>>\(target),\(hardworking),\(possum),\(visits),\(wrath),\(excellent ?? 0.0),\(carpenter ?? 0.0),\(parents ?? ""),\(confide)")
            let dict = ["target":target,"possum":possum,"hardworking":hardworking,"visits":visits,"wrath":wrath,"excellent":excellent ?? 0.0,"carpenter":carpenter ?? 0.0,"parents":parents ?? "","confide":confide] as [String : Any]
            NetApiWork.shared.requestAPI(params: dict, pageUrl: fullyYoure, method: .post) { baseModel in
                let awareness = baseModel.awareness
                if awareness == 0 || awareness == 00 {
                    USER_DEFAULTS.setValue("1", forKey: MAIDIAN_ONE)
                    USER_DEFAULTS.synchronize()
                }
            } errorBlock: { error in
                
            }
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
