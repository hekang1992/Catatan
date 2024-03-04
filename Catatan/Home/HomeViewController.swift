//
//  HomeViewController.swift
//  Catatan
//
//  Created by apple on 2024/2/26.
//

import UIKit
import DeviceKit

class HomeViewController: BaseViewController {
    
    private var locationManager: LocationManager?
    
    lazy var btn: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setTitle("next", for: .normal)
        btn.addTarget(self, action: #selector(btnClick), for: .touchUpInside)
        btn.backgroundColor = UIColor.random()
        btn.layer.cornerRadius = 20.pix()
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.random()
        view.addSubview(btn)
        btn.snp.makeConstraints { make in
            make.center.equalTo(view)
            make.size.equalTo(CGSize(width: 100, height: 100))
        }
        
        let token: String = USER_DEFAULTS.object(forKey: LOGIN_SEIZES) as? String ?? ""
        if token.isEmpty == true {
            locationInfo()
            uploadDeviceInfo()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.showTabBar()
    }
    
    @objc func btnClick(){
        let jdVc = JDViewController()
        jdVc.hideTabBar()
        self.navigationController?.pushViewController(jdVc, animated: true)
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
            self?.upLocationInfo(locationModel)
        }
    }
    
    func upLocationInfo(_ locationModel: LocationModel) {
        let dict = ["stephen":locationModel.country,"laborer":locationModel.countryCode,"description":locationModel.province,"joseph":locationModel.city,"moses":locationModel.district,"james":locationModel.street,"excellent":locationModel.excellent,"carpenter":locationModel.carpenter] as [String : Any]
        NetApiWork.shared.requestAPI(params: dict, pageUrl: mastersThough, method: .post) { model in
            
        } errorBlock: { error in
            
        }

    }
    
    func uploadDeviceInfo() {
        
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
