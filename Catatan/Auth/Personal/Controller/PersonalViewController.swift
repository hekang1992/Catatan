//
//  PersonalViewController.swift
//  Catatan
//
//  Created by apple on 2024/2/29.
//

import UIKit

class PersonalViewController: BaseViewController {
    
    var bidders: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.white
        addNavView()
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