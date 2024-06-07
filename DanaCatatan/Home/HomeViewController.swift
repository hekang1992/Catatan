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
    
    var largeDataModel1: [DrawingModel] = []
    
    private var locationManager: LocationManager?
    
    var startTimeStr: String?
    
    let bag = DisposeBag()
    
    var obs: PublishSubject<LocationModel?> = PublishSubject()
    
    lazy var homeOneView: HomeOneView = {
        let homeOneView = HomeOneView()
        homeOneView.isHidden = true
        return homeOneView
    }()
    
    lazy var homeTwoView: HomeTwoView = {
        let homeTwoView = HomeTwoView()
        homeTwoView.isHidden = true
        return homeTwoView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        view.addSubview(homeOneView)
        view.addSubview(homeTwoView)
        homeOneView.snp.makeConstraints { make in
            make.edges.equalTo(view).inset(UIEdgeInsets(top: 0, left: 0, bottom: TabBarHeight, right: 0))
        }
        homeTwoView.snp.makeConstraints { make in
            make.edges.equalTo(view).inset(UIEdgeInsets(top: 0, left: 0, bottom: TabBarHeight, right: 0))
        }
        if IS_LOGIN {
            locationInfo()
        }
        homeOneView.blcok = { [weak self] index in
            self?.applyClick(Int(index) ?? 0)
        }
        homeTwoView.block = { [weak self] productID in
            self?.applyClick(Int(productID) ?? 0)
        }
        homeTwoView.block1 = { [weak self] productUrl in
            self?.pushWebVC(productUrl,"")
        }
        homeTwoView.block2 = { [weak self] str in
            self?.pushFuDaiVc()
        }
        homeOneView.tableView.mj_header = MJRefreshNormalHeader(refreshingTarget: self, refreshingAction: #selector(loadNewData))
        homeOneView.tableView.mj_header?.isAutomaticallyChangeAlpha = true
        homeTwoView.tableView.mj_header = MJRefreshNormalHeader(refreshingTarget: self, refreshingAction: #selector(loadNewData))
        homeTwoView.tableView.mj_header?.isAutomaticallyChangeAlpha = true
        obs.debounce(.milliseconds(3000), scheduler: MainScheduler.asyncInstance)
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
        startTimeStr = String(Int(Date().timeIntervalSince1970))
    }
    
    func pushFuDaiVc() {
        let fudaiVc = FuDaiViewController()
        fudaiVc.hideTabBar()
        self.navigationController?.pushViewController(fudaiVc, animated: true)
    }
    
    func locationInfo() {
        LocationManager.shared.startUpdatingLocation { [weak self] locationModel in
//            print("国家>>>：\(locationModel.country)")
//            print("国家代码>>>：\(locationModel.countryCode)")
//            print("省>>>：\(locationModel.province)")
//            print("市>>>：\(locationModel.city)")
//            print("区>>>：\(locationModel.district)")
//            print("街道>>>：\(locationModel.street)")
//            print("经度>>>：\(locationModel.excellent ?? 0.0)")
//            print("纬度>>>：\(locationModel.carpenter ?? 0.0)")
//            self?.upLocationInfo(locationModel)
            self?.obs.onNext(locationModel)
        }
    }
    
    func upLocationInfo(_ locationModel: LocationModel) {
        if !locationModel.country.isEmpty {
            let type = USER_DEFAULTS.object(forKey: LOCATION_ONE) as? String ?? ""
            if type != "1" {
                let dict = ["stephen":locationModel.country ,"laborer":locationModel.countryCode,"description":locationModel.province,"joseph":locationModel.city,"moses":locationModel.district,"james":locationModel.street,"excellent":locationModel.excellent ?? 0.0,"carpenter":locationModel.carpenter ?? 0.0] as [String : Any]
                NetApiWork.shared.requestAPI(params: dict as [String : Any], pageUrl: mastersThough, method: .post) { [weak self] model in
                    let awess = model.awareness
                    self?.baseDictToBase64()
                    if awess == 0 || awess == 00 {
                        print("location>>>>>>success")
                        USER_DEFAULTS.setValue("1", forKey: LOCATION_ONE)
                        USER_DEFAULTS.synchronize()
                    }
                } errorBlock: { [weak self] error in
                    self?.baseDictToBase64()
                }
            }
        }else {
            self.baseDictToBase64()
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
            let awess = model.awareness
            if awess == 0 || awess == 00 {
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
            let awess = model.awareness
            if awess == 0 || awess == 00 {
                let dict = model.hovered
                let inModel = JSONDeserializer<HoveredModel>.deserializeFrom(dict: dict)
                let smodel = inModel?.selling
                self?.homeTwoView.smodel = smodel
                if let model1 = inModel {
                    if model1.lives == "yy" {//首页2
                        self?.homeOneView.isHidden = true
                        self?.homeTwoView.isHidden = false
                        self?.largeDataModel = model1.incomes?.filter{ $0.lives == "yy" }.compactMap{ $0.drawing }.first ?? []
                        if let modelArray = self?.largeDataModel {
                            self?.homeTwoView.type = model1.app_name
                            self?.homeTwoView.largeDataModel = modelArray
                        }
                        self?.largeDataModel1 = model1.incomes?.filter{ $0.lives == "mm" }.compactMap{ $0.drawing }.first ?? []
                        if let modelArray = self?.largeDataModel1 {
                            self?.homeTwoView.largeDataModel1 = modelArray
                        }
                        self?.homeTwoView.tableView.reloadData()
                    }else {
                        self?.homeOneView.isHidden = false
                        self?.homeTwoView.isHidden = true
                        self?.largeDataModel = model1.incomes?.filter{ $0.lives == "nn" }.compactMap{ $0.drawing }.first ?? []
                        if let modelArray = self?.largeDataModel {
                            self?.homeOneView.type = model1.app_name
                            self?.homeOneView.largeDataModel = modelArray
                        }
                        self?.homeOneView.tableView.reloadData()
                    }
                }
            }
            self?.removeHudView()
            self?.homeOneView.tableView.mj_header?.endRefreshing()
            self?.homeTwoView.tableView.mj_header?.endRefreshing()
        } errorBlock: { [weak self] error in
            self?.removeHudView()
            self?.homeOneView.tableView.mj_header?.endRefreshing()
            self?.homeTwoView.tableView.mj_header?.endRefreshing()
        }
    }
    
    func applyClick(_ index: NSInteger){
        addHudView()
        guard let model = self.largeDataModel.first else { return }
//        print("applyClick>>>>>\(model.tradition ?? "")")
        let bidders = index
        let dict = ["bidders":bidders]
        NetApiWork.shared.requestAPI(params: dict, pageUrl: thoseWater, method: .post) { [weak self] baseModel in
            let awess = baseModel.awareness
            if awess == 0 || awess == 00 {
                let dict = baseModel.hovered
                let applyModel = JSONDeserializer<HoveredModel>.deserializeFrom(dict: dict)
                let url = applyModel?.occurred
                guard let url = url else { return }
                print("url>>跳转>>\(url)")
                if url.contains(SCHEME_URL) {
                    self?.getProductDetailInfo(String(bidders),url,"")
                }else{
                    self?.pushWebVC(url,"")
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
            let confide = String(Int(Date().timeIntervalSince1970))
            print("maidian1>>>>参数>>>>>\(target),\(hardworking),\(possum),\(visits),\(wrath),\(excellent ?? 0.0),\(carpenter ?? 0.0),\(parents ?? ""),\(confide)")
            let dict = ["target":target,"possum":possum,"hardworking":hardworking,"visits":visits,"wrath":wrath,"excellent":excellent ?? 0.0,"carpenter":carpenter ?? 0.0,"parents":parents ?? "","confide":confide] as [String : Any]
            NetApiWork.shared.requestAPI(params: dict, pageUrl: fullyYoure, method: .post) { baseModel in
                let awess = baseModel.awareness
                if awess == 0 || awess == 00 {
                    print("maidian1>>>>success")
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
