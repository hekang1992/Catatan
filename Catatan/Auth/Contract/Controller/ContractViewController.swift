//
//  ContractViewController.swift
//  Catatan
//
//  Created by apple on 2024/2/29.
//

import UIKit

class ContractViewController: BaseViewController {
    
    var bidders: String = ""
    
    lazy var contractView: ContractView = {
        let contractView = ContractView()
        return contractView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        addNavView()
        navView.block = { [weak self] in
            self?.popToSpecificViewController()
        }
        view.addSubview(contractView)
        view.insertSubview(contractView, belowSubview: navView)
        contractView.snp.makeConstraints { make in
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
