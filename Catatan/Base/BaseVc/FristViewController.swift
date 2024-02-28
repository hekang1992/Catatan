//
//  FristViewController.swift
//  Catatan
//
//  Created by apple on 2024/2/26.
//

import UIKit
import Alamofire

class FristViewController: BaseViewController {
    
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
        CNotificationCenter.post(name: NSNotification.Name(SET_ROOTVC), object: nil)
        self.netStatus()
    }
    
    func netStatus() {
        NetworkManager.shared.observeNetworkStatus { [weak self] status in
            switch status {
            case .wifi:
                print("WiFi连接")
                self?.googleMarket()
            case .cellular:
                print("蜂窝数据连接")
                self?.googleMarket()
            case .none:
                print("无网络连接")
            }
        }
    }
    
    //google
    func googleMarket() {
        
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

