//
//  FaceViewController.swift
//  Catatan
//
//  Created by apple on 2024/2/29.
//

import UIKit
import Toast_Swift
import TYAlertController

class FaceViewController: BaseViewController {

    lazy var faceViwe: FaceView = {
        let faceViwe = FaceView()
        return faceViwe
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.white
        addNavView()
        navView.nameLabel.text = "Informasi dasar"
        navView.block = { [weak self] in
            self?.navigationController?.popViewController(animated: true)
        }
        view.insertSubview(faceViwe, belowSubview: navView)
        faceViwe.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }
        faceViwe.block1 = { [weak self] in
            self?.popPhotoView()
        }
        faceViwe.block2 = { [weak self] in
            self?.popCameraView()
        }
        faceViwe.block3 = { [weak self] in
            self?.nextVc()
        }
    }
    
    func nextVc() {
        self.view.makeToast("next", duration: 1.0, position: .center )
    }
    
    func popPhotoView() {
        let selView = PopImageView(frame: self.view.bounds)
        let alertVc = TYAlertController(alert: selView, preferredStyle: .actionSheet)
        self.present(alertVc!, animated: true)
        selView.block1 = { [weak self] in
            self?.xiangji()
        }
        selView.block2 = { [weak self] in
            self?.xiangce()
        }
        selView.block3 = { [weak self] in
            self?.dismiss(animated: true)
        }
    }
    
    func popCameraView() {
        let selView = CameraView(frame: self.view.bounds)
        let alertVc = TYAlertController(alert: selView, preferredStyle: .actionSheet)
        self.present(alertVc!, animated: true)
        selView.block1 = { [weak self] in
            self?.xiangji()
        }
        selView.block2 = { [weak self] in
            self?.dismiss(animated: true)
        }
    }
    
    func xiangji() {
        
    }
    
    func xiangce() {
        
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
