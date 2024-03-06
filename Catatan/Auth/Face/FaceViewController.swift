//
//  FaceViewController.swift
//  Catatan
//
//  Created by apple on 2024/2/29.
//

import UIKit
import TYAlertController
import HandyJSON

class FaceViewController: BaseViewController {
    
    var bidders: String = ""

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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addHudView()
        let dict = ["bidders":bidders]
        NetApiWork.shared.requestAPI(params: dict, pageUrl: shackledPenetrate, method: .get) { [weak self] baseModel in
            let hovered = baseModel.hovered
            let awareness = baseModel.awareness
            if awareness == 0 || awareness == 00 {
                let model = JSONDeserializer<HoveredModel>.deserializeFrom(dict: hovered)
            }
            self?.removeHudView()
        } errorBlock: { [weak self] error in
            self?.removeHudView()
        }
    }
    
    func nextVc() {
        let personVc = PersonalViewController()
        self.navigationController?.pushViewController(personVc, animated: true)
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
