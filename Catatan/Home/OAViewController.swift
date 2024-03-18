//
//  OAViewController.swift
//  Catatan
//
//  Created by apple on 2024/3/18.
//

import UIKit

class OAViewController: BaseViewController {
    
    lazy var bgView1: UIView = {
        let bgView = UIView()
        bgView.backgroundColor = UIColor("#F4F8EE")
        return bgView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.bgView.hide()
        view.addSubview(bgView1)
        bgView1.snp.makeConstraints { make in
            make.edges.equalTo(view)
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
