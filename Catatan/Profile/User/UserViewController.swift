//
//  UserViewController.swift
//  Catatan
//
//  Created by apple on 2024/2/26.
//

import UIKit
import JXGradientKit

class UserViewController: BaseViewController {
    
    lazy var userView: ProfileView = {
        let userView = ProfileView()
        return userView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        view.addSubview(bgView)
        bgView.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }
        bgView.addSubview(userView)
        userView.snp.makeConstraints { make in
            make.edges.equalTo(bgView)
        }
        userView.blcok = {[weak self] index,title in
            self?.indexWithVc(index,title)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.showTabBar()
    }
    
    func indexWithVc(_ index: NSInteger, _ title: String) {
        switch index {
        case 0...2:
            orderListVc(index,title)
            break
        case 3:
            email()
            break
        case 4:
            logoutAccount()
            break
        case 5:
            deleteAccount()
            break
        default:
            break
        }
    }
    
    func orderListVc(_ index: NSInteger, _ title: String) {
        let orderVc = OrderViewController()
        orderVc.nameStr = title
        orderVc.hideTabBar()
        self.navigationController?.pushViewController(orderVc, animated: true)
    }
    
    func email() {
        let aboutVc = AboutViewController()
        aboutVc.hideTabBar()
        self.navigationController?.pushViewController(aboutVc, animated: true)
    }
    
    func logoutAccount() {
        view.makeToast("logoutAccount",duration: 1.0,position: .center)
    }
    
    func deleteAccount() {
        view.makeToast("deleteAccount",duration: 1.0,position: .center)
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
