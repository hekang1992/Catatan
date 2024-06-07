//
//  BaseViewController.swift
//  Catatan
//
//  Created by apple on 2024/2/26.
//

import UIKit
import JXGradientKit
import HandyJSON
import MBProgressHUD_WJExtension
import TYAlertController

class BaseViewController: UIViewController,UINavigationControllerDelegate {
    
    lazy var bgView: GradientView = {
        let bgView = GradientView()
        let topColer = UIColor("#E4D7EF")
        let minColer = UIColor("#DEE9CF")
        let booColer = UIColor("#E2EFF3")
        bgView.direction = GradientDirection.topToBottom
        bgView.startColor = topColer
        bgView.middleColor = minColer
        bgView.endColor = booColer
        return bgView
    }()
    
    lazy var navView: CNavView = {
        let view = CNavView()
        view.frame = .zero
        return view
    }()
    
    lazy var hud: HudView = {
        let hud = HudView()
        hud.frame = self.view.bounds
        return hud
    }()
    
    lazy var emptyView: EmptyView = {
        let emptyView = EmptyView()
        emptyView.frame = CGRectMake(0, CGFloat(NAV_HIGH), SCREEN_WIDTH, SCREEN_HEIGHT - CGFloat(NAV_HIGH))
        return emptyView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.delegate = self
        // Do any additional setup after loading the view.
        view.addSubview(bgView)
        bgView.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }
    }
    
    func showTabBar() {
        if let tabbarVc = UIApplication.shared.delegate?.window??.rootViewController as? TabBarViewController {
            tabbarVc.showTabBar()
        }
    }
    
    func hideTabBar() {
        if let tabbarVc = UIApplication.shared.delegate?.window??.rootViewController as? TabBarViewController {
            tabbarVc.hideTabBar()
        }
    }
    
    func addNavView() {
        view.addSubview(navView)
        navView.snp.makeConstraints { make in
            make.height.equalTo(NAV_HIGH)
            make.left.right.top.equalTo(view)
        }
    }
    
    func addHudView() {
        if let keyWindow = UIApplication.shared.keyWindow {
            keyWindow.addSubview(hud)
            delay(20) { [weak self] in
                self?.hud.removeFromSuperview()
            }
        }
    }
    
    func removeHudView() {
        hud.removeFromSuperview()
    }
    
    func addEmptyView() {
        self.view.addSubview(emptyView)
    }
    
    func removeEmptyView() {
        emptyView.removeFromSuperview()
    }
    
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        // 禁用侧滑返回
        navigationController.interactivePopGestureRecognizer?.isEnabled = false
    }
    
    func maidian(productID: String,startTime: String,type: String,orderID: String) {
        let model = LocationManager.shared.locatinModel
        let target = productID
        let possum = type
        let hardworking = orderID
        let visits = DeviceInfo.finely()
        let wrath = DeviceInfo.stroll()
        let excellent = model.excellent
        let carpenter = model.carpenter
        let parents = startTime
        let confide = String(Int(Date().timeIntervalSince1970))
        print("maidian>>>>参数>>>>>\(target),\(hardworking),\(possum),\(visits),\(wrath),\(excellent ?? 0.0),\(carpenter ?? 0.0),\(parents),\(confide)")
        let dict = ["target":target,"possum":possum,"hardworking":hardworking,"visits":visits,"wrath":wrath,"excellent":excellent ?? 0.0,"carpenter":carpenter ?? 0.0,"parents":parents,"confide":confide] as [String : Any]
        NetApiWork.shared.requestAPI(params: dict, pageUrl: fullyYoure, method: .post) { baseModel in
            let awess = baseModel.awareness
            if awess == 0 || awess == 00 {
                print("maidian\(type)>>>>success")
                USER_DEFAULTS.setValue("1", forKey: MAIDIAN_ONE)
                USER_DEFAULTS.synchronize()
            }
        } errorBlock: { error in
            
        }
    }
    
    func getProductDetailInfo(_ bidders: String,_ url: String, _ type: String) {
        let dict = ["bidders":bidders]
        addHudView()
        NetApiWork.shared.requestAPI(params: dict as [String : Any], pageUrl: fieldQuite, method: .post) { [weak self] baseModel in
            let hovered = baseModel.hovered
            let awess = baseModel.awareness
            if awess == 0 || awess == 00 {
                let model = JSONDeserializer<HoveredModel>.deserializeFrom(dict: hovered)
                let picture = model?.circumstance?.picture
                let hardworking = model?.blouses?.hardworking
                let occurred: String = model?.occurred ?? ""
                if picture != nil {
                    if url.isEmpty {
                        self?.nextPushVc(picture ?? "",hardworking ?? "",bidders)
                    }else {
                        CManager.pageJump(path: url, isVerify: false ,type)
                    }
                }else {
                    //通过orderid去获取url
                    if occurred.contains("http://") || occurred.contains("https://") {
                        self?.pushWebVC(occurred, "")
                    }else {
                        if let modelq = model {
                            self?.orderIDUrl(hardworking ?? "",modelq.blouses?.chests ?? "",modelq.blouses?.signify ?? "",modelq.blouses?.grievous ?? "", type)
                        }
                    }
                    
                }
            }
            self?.removeHudView()
        } errorBlock: { [weak self] error in
            self?.removeHudView()
        }
    }
    
    func nextPushVc(_ picture: String,_ hardworking: String, _ bidders: String) {
        if picture == "dcan1" {
            let photoVc = FaceViewController()
            photoVc.bidders = bidders
            photoVc.hardworking = hardworking
            getVc(photoVc)
        }else if picture == "dcan2" {
            let personVc = PersonalViewController()
            personVc.bidders = bidders
            personVc.hardworking = hardworking
            getVc(personVc)
        }else if picture == "dcan3" {
            let conVc = ContractViewController()
            conVc.bidders = bidders
            conVc.hardworking = hardworking
            getVc(conVc)
        }else if picture == "dcan4" {
            let bankVc = BankViewController()
            bankVc.bidders = bidders
            bankVc.hardworking = hardworking
            getVc(bankVc)
        }else{}
    }
    
    func getVc(_ currentVc: BaseViewController) {
        self.navigationController?.pushViewController(currentVc, animated: true)
    }
    
    func popToSpecificViewController(_ type: String) {
        if let navigationController = self.navigationController {
            var viewControllerFound = false
            if type == "bank" {
                navigationController.popToRootViewController(animated: true)
            }else {
                for viewController in navigationController.viewControllers {
                    if let targetViewController = viewController as? JDViewController {
                        navigationController.popToViewController(targetViewController, animated: true)
                        viewControllerFound = true
                        break
                    }
                }
            }
            
            if !viewControllerFound {
                navigationController.popViewController(animated: true)
            }
        }
    }
    
    func goSet() {
        if let url = URL(string: UIApplication.openSettingsURLString), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    func wanLiuAuthView(_ title: String) {
        let exitView = ExitView()
        exitView.descLabel.text = title
        exitView.sureBtn.setTitle("Konfirmasi", for: .normal)
        exitView.cancelBtn.setTitle("Batal", for: .normal)
        exitView.sureBtn.backgroundColor = UIColor("#FFFFFF")
        exitView.sureBtn.setTitleColor(.black, for: .normal)
        exitView.cancelBtn.backgroundColor = UIColor("#BBD598")
        exitView.cancelBtn.setTitleColor(.white, for: .normal)
        exitView.frame = self.view.bounds
        let alertVC = TYAlertController(alert: exitView, preferredStyle: .alert)
        self.present(alertVC!, animated: true)
        exitView.block = { [weak self] in
            self?.dismiss(animated: true, completion: {
                self?.popToSpecificViewController("")
            })
        }
        exitView.cblock = { [weak self] in
            self?.dismiss(animated: true)
        }
    }
    
    func wanLiuView(_ title: String) {
        let exitView = ExitView()
        exitView.descLabel.text = title
        exitView.sureBtn.setTitle("Pengaturan", for: .normal)
        exitView.cancelBtn.setTitle("Batal", for: .normal)
        exitView.sureBtn.backgroundColor = UIColor("#BBD598")
        exitView.sureBtn.setTitleColor(.white, for: .normal)
        exitView.cancelBtn.backgroundColor = UIColor("#FFFFFF")
        exitView.cancelBtn.setTitleColor(.black, for: .normal)
        exitView.frame = self.view.bounds
        let alertVC = TYAlertController(alert: exitView, preferredStyle: .alert)
        self.present(alertVC!, animated: true)
        exitView.block = { [weak self] in
            self?.dismiss(animated: true, completion: {
                self?.goSet()
            })
        }
        exitView.cblock = { [weak self] in
            self?.dismiss(animated: true)
        }
    }
    
    func orderIDUrl(_ orderId: String,_ chests: String,_ signify: String,_ grievous: String, _ type: String) {
        let dict = ["warehouse":orderId,"chests":chests,"signify":signify,"grievous":grievous]
        addHudView()
        NetApiWork.shared.requestAPI(params: dict, pageUrl: districtUnder, method: .post) { [weak self] baseModel in
            let awess = baseModel.awareness
            if awess == 0 || awess == 00 {
                let model = JSONDeserializer<HoveredModel>.deserializeFrom(dict: baseModel.hovered)
                if let model = model {
                    let url = model.occurred
                    print("url>>>>>>>>\(url ?? "")")
                    self?.pushWebVC(url ?? "", type)
                }
            }
            self?.removeHudView()
        } errorBlock: { [weak self] error in
            self?.removeHudView()
        }
    }
    
    func pushWebVC(_ url: String, _ type: String) {
        let webVc = CWebViewController()
        var urlString: String?
        if url.contains("?") {
             urlString = url + "&" + CommonParams.getParas()
        }else {
             urlString = url + "?" + CommonParams.getParas()
        }
        if let encodedURLString = urlString?.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) {
            if let encodedURL = URL(string: encodedURLString) {
                print("Encoded URL: \(encodedURL)")
            } else {
                print("无法创建编码后的URL")
            }
        } else {
            print("URL编码失败")
        }
        webVc.url = urlString
        webVc.type = type
        webVc.hideTabBar()
        getVc(webVc)
    }
    
    func delay(_ delay: TimeInterval, closure: @escaping () -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            closure()
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

