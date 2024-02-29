//
//  JDViewController.swift
//  Catatan
//
//  Created by apple on 2024/2/29.
//

import UIKit

class JDViewController: BaseViewController {

    lazy var jdView: JDView = {
        let jdView = JDView()
        return jdView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.addSubview(jdView)
        jdView.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }
        
        jdView.block = {[weak self] in
            self?.navigationController?.popViewController(animated: true)
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
