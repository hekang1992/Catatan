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
        hud.frame = CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT)
        return hud
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
            make.left.right.top.equalTo(view)
            make.height.equalTo(NAV_HIGH)
        }
    }
    
    func addHudView() {
        if let keyWindow = UIApplication.shared.keyWindow {
            keyWindow.addSubview(hud)
        }
    }
    
    func removeHudView() {
        hud.removeFromSuperview()
    }
    
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        // 禁用侧滑返回
        navigationController.interactivePopGestureRecognizer?.isEnabled = false
    }
    
    func getProductDetailInfo(_ bidders: String) {
        let dict = ["bidders":bidders]
        addHudView()
        NetApiWork.shared.requestAPI(params: dict as [String : Any], pageUrl: fieldQuite, method: .post) { [weak self] baseModel in
            let hovered = baseModel.hovered
            let awareness = baseModel.awareness
            if awareness == 0 || awareness == 00 {
                let model = JSONDeserializer<HoveredModel>.deserializeFrom(dict: hovered)
                let picture = model?.circumstance?.picture
                let hardworking = model?.blouses?.hardworking
                self?.nextPushVc(picture!,hardworking!,bidders)
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
            getVc(personVc)
        }else if picture == "dcan3" {
            let conVc = ContractViewController()
            conVc.bidders = bidders
            getVc(conVc)
        }else if picture == "dcan4" {
            let bankVc = BankViewController()
            bankVc.bidders = bidders
            getVc(bankVc)
        }else{}
    }
    
    func getVc(_ currentVc: BaseViewController) {
        self.navigationController?.pushViewController(currentVc, animated: true)
    }
    
    func popToSpecificViewController() {
        if let navigationController = self.navigationController {
            for viewController in navigationController.viewControllers {
                if let targetViewController = viewController as? FaceViewController {
                    navigationController.popToViewController(targetViewController, animated: true)
                    break
                }
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

