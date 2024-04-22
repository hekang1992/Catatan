//
//  FristViewController.swift
//  Catatan
//
//  Created by apple on 2024/2/26.
//

import UIKit
import Alamofire
import AppsFlyerLib
import HandyJSON

class FristViewController: BaseViewController {
    
    lazy var bgImageView: UIImageView = {
        let bgImageView = UIImageView()
        bgImageView.contentMode = .scaleAspectFill
        bgImageView.image = UIImage(named: "launch")
        return bgImageView
    }()
    
    var isUpload:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.white
        view.addSubview(bgImageView)
        bgImageView.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }
        self.netStatus()
        USER_DEFAULTS.setValue("0", forKey: LOCATION_ONE)
        USER_DEFAULTS.synchronize()
        
//        // 创建一个并行队列
//        let concurrentQueue = OperationQueue()
//        concurrentQueue.maxConcurrentOperationCount = 3 // 设置最大并发操作数为3，可以根据需要调整
//
//        // 创建第一个网络请求操作
//        let operation1 = BlockOperation {
//            if let url = URL(string: "https://www.apple.com") {
//                if let data = try? Data(contentsOf: url) {
//                    // 处理第一个请求返回的数据
//                    print("Received data from request 1: \(data)")
//                }
//            }
//        }
//
//        // 创建第二个网络请求操作
//        let operation2 = BlockOperation {
//            if let url = URL(string: "https://www.apple.com") {
//                if let data = try? Data(contentsOf: url) {
//                    // 处理第二个请求返回的数据
//                    print("Received data from request 2: \(data)")
//                }
//            }
//        }
//
//        // 创建第三个网络请求操作，它依赖于第一个操作
//        let operation3 = BlockOperation {
//            if let url = URL(string: "https://www.apple.com") {
//                if let data = try? Data(contentsOf: url) {
//                    // 处理第三个请求返回的数据
//                    print("Received data from request 3: \(data)")
//                }
//            }
//        }
//
//        // 将操作添加到并行队列中
//        concurrentQueue.addOperation(operation1)
//
//        // 设置第三个操作依赖于第一个操作
//        operation2.addDependency(operation1)
//        operation3.addDependency(operation2)
//        concurrentQueue.addOperation(operation2)
//        concurrentQueue.addOperation(operation3)
        
    }
    
    func netStatus() {
        NetworkManager.shared.observeNetworkStatus { [weak self] status in
            switch status {
            case .wifi:
                self?.devInfo()
                self?.googleMarket()
            case .cellular:
                self?.devInfo()
                self?.googleMarket()
            case .none:
                print("无网络连接")
            }
        }
    }
    
    //google
    func googleMarket() {
        if self.isUpload == false {
            let finely = DeviceInfo.finely()
            let stroll = DeviceInfo.stroll()
            let dict = ["finely":finely,"stroll":stroll]
            NetApiWork.shared.requestAPI(params: dict as [String : Any], pageUrl: singledTrouble, method: .post) { [weak self] model in
                let awareness = model.awareness
                if awareness == 0 || awareness == 00 {
                    let dict = model.hovered
                    let googleModel = JSONDeserializer<HoveredModel>.deserializeFrom(dict: dict)
                    if let googleModel = googleModel {
                        self?.upLoadGoole(googleModel.decades ?? "", googleModel.trapped ?? "")
                        self?.isUpload = true
                        print("googleMarket>>>>>>success")
                    }
                }
            } errorBlock: { error in
                
            }
        }
    }
    
    func upLoadGoole(_ appid: String, _ key: String) {
        AppsFlyerLib.shared().appsFlyerDevKey = key
        AppsFlyerLib.shared().appleAppID = appid
        AppsFlyerLib.shared().start()
    }
    
    func devInfo() {
        let dict = ["together":"php"]
        NetApiWork.shared.requestAPI(params: dict, pageUrl: shirtingSouth, method: .post) { baseModel in
            let awareness = baseModel.awareness
            if awareness == 0 || awareness == 00 {
                let model = JSONDeserializer<HoveredModel>.deserializeFrom(dict: baseModel.hovered)
                let cleaved = (model?.cleaved ?? "") as String
                if cleaved == "uu" {//b面
                    let dict = ["cleaved":"uu"]
                    CNotificationCenter.post(name: NSNotification.Name(SET_ROOTVC), object: nil , userInfo: dict)
                }else{
                    let dict = ["cleaved":"aa"]
                    CNotificationCenter.post(name: NSNotification.Name(SET_ROOTVC), object: nil , userInfo: dict)
                }
            }else {
                let dict = ["cleaved":"aa"]
                CNotificationCenter.post(name: NSNotification.Name(SET_ROOTVC), object: nil , userInfo: dict)
            }
        } errorBlock: { error in
            let dict = ["cleaved":"aa"]
            CNotificationCenter.post(name: NSNotification.Name(SET_ROOTVC), object: nil , userInfo: dict)
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

