//
//  OrderViewController.swift
//  Catatan
//
//  Created by apple on 2024/2/26.
//

import UIKit

class OrderViewController: BaseViewController {
    
    var nameStr: String?
    
    var typeStr: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.s
        addNavView()
        navView.nameLabel.text = nameStr
        navView.block = { [weak self] in
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
