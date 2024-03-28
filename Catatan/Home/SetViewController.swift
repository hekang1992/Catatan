//
//  SetViewController.swift
//  Catatan
//
//  Created by apple on 2024/3/28.
//

import UIKit

class SetViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        addNavView()
        navView.nameLabel.text = "Bank Wealth"
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
