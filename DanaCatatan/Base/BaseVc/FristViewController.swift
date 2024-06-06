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
import AppTrackingTransparency

class FristViewController: BaseViewController {
    
    var apiArray: [String] = []
    
    var isGit: Bool = false
    
    lazy var bgImageView: UIImageView = {
        let bgImageView = UIImageView()
        bgImageView.contentMode = .scaleAspectFill
        bgImageView.image = UIImage(named: "launch")
        return bgImageView
    }()
    
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
                print("wifi")
            case .cellular:
                self?.devInfo()
                print("4g/5g")
            case .none:
                print("无网络连接")
            }
        }
    }
    
    func devInfo() {
        let dict = ["together":"php"]
        NetApiWork.shared.requestAPI(params: dict, pageUrl: shirtingSouth, method: .post) { [weak self] baseModel in
            let awess = baseModel.awareness
            if awess == 0 || awess == 00 {
                let model = JSONDeserializer<HoveredModel>.deserializeFrom(dict: baseModel.hovered)
                let cleaved = (model?.cleaved ?? "") as String
                if cleaved == "uu" {//b面
                    self?.bmian()
                }else if cleaved == "ue" {
                    self?.bmian()
//                    self?.amian()
                }else {
                    self?.requestGit()
                }
            }else {
                self?.requestGit()
            }
        } errorBlock: { [weak self] error in
            self?.requestGit()
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


extension FristViewController {

//    func amian() {
//        let dict = ["cleaved":"aa"]
//        CNotificationCenter.post(name: NSNotification.Name(SET_ROOTVC), object: nil , userInfo: dict)
//    }
    
    func bmian() {
        let dict = ["cleaved":"uu"]
        CNotificationCenter.post(name: NSNotification.Name(SET_ROOTVC), object: nil , userInfo: dict)
    }
    
    func requestGit() {
        DispatchQueue.global(qos: .default).async {
            let originalURLString = BASE_GIT_URL
            guard let data = originalURLString.data(using: .utf8) else { return }
            let base64String = data.base64EncodedString()
            guard let decodedData = Data(base64Encoded: base64String),
                  let decodedURLString = String(data: decodedData, encoding: .utf8),
                  let url = URL(string: decodedURLString) else {
                return
            }
            do {
                let base64 = try String(contentsOf: url, encoding: .utf8)
                let decodedString = base64.replacingOccurrences(of: "\n", with: "")
                guard let finalDecodedData = Data(base64Encoded: decodedString),
                      let stringV = String(data: finalDecodedData, encoding: .utf8) else {
                    return
                }
                let stringArray = stringV.components(separatedBy: ",")
                DispatchQueue.main.async {
                    self.apiArray = stringArray
                    self.netarrayApi(shirtingSouth, index: 0)
                }
            } catch {
                print("Error occurred: \(error)")
            }
        }
    }
    
    func netarrayApi(_ apiUrl: String, index: Int) {
        if isGit == false {
            guard index < apiArray.count else {
                return
            }
            UserDefaults.standard.set(apiArray[index], forKey: APIBAERURL)
            UserDefaults.standard.synchronize()
            let dict = ["together":"php"]
            NetApiWork.shared.requestAPI(params: dict, pageUrl: apiUrl, method: .post) { [weak self] baseModel in
                let awess = baseModel.awareness
                if awess == 0 || awess == 00 {
                    let model = JSONDeserializer<HoveredModel>.deserializeFrom(dict: baseModel.hovered)
                    let cleaved = (model?.cleaved ?? "") as String
                    if cleaved == "uu" {//b面
                        self?.bmian()
                        self?.isGit = true
                    }else if cleaved == "ue" {
//                        self?.amian()
                        self?.bmian()
                        self?.isGit = true
                    }else {
                        self?.isGit = false
                        self?.netarrayApi(shirtingSouth, index: index + 1)
                    }
                }else {
                    self?.isGit = false
                    self?.netarrayApi(shirtingSouth, index: index + 1)
                }
            } errorBlock: { [weak self] error in
                self?.isGit = false
                self?.netarrayApi(shirtingSouth, index: index + 1)
            }
        }
    }
}
