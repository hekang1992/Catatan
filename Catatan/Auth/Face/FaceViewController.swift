//
//  FaceViewController.swift
//  Catatan
//
//  Created by apple on 2024/2/29.
//

import UIKit
import TYAlertController
import HandyJSON
import AVFoundation
import Photos

class FaceViewController: BaseViewController, UIImagePickerControllerDelegate {
    
    var bidders: String = ""
    
    let imagePicker = UIImagePickerController()
    
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
            self?.dismiss(animated: true,completion: {
                self?.xiangji(0)
            })
        }
        selView.block2 = { [weak self] in
            self?.dismiss(animated: true,completion: {
                self?.xiangce()
            })
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
            self?.dismiss(animated: true,completion: {
                self?.xiangji(1)
            })
        }
        selView.block2 = { [weak self] in
            self?.dismiss(animated: true)
        }
    }
    
    func xiangji(_ index: Int) {
        openCamera(index)
    }
    
    func xiangce() {
        
    }
    
    func openCamera(_ index: Int) {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            checkCameraPermission { [weak self] granted in
                if granted {
                    DispatchQueue.main.async {
                        self?.imagePicker.delegate = self
                        self?.imagePicker.delegate = self
                        self?.imagePicker.sourceType = .camera
                        if index == 0 {
                            self?.imagePicker.cameraDevice = .rear
                        }else {
                            self?.imagePicker.cameraDevice = .front
                        }
                        self?.present(self!.imagePicker, animated: true)
                    }
                } else {
                    
                }
            }
        } else {
            print("Device doesn't support camera.")
        }
    }
    
    func openPhotoLibrary() {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            checkPhotoPermission { [weak self] (granted) in
                if granted {
                    DispatchQueue.main.async {
                        self?.imagePicker.delegate = self
                        self?.imagePicker.sourceType = .photoLibrary
                        if let imagePicker = self?.imagePicker{
                            self?.present(imagePicker, animated: true, completion: nil)
                        }
                    }
                }
            }
            
        } else {
            print("Device doesn't support photo library.")
        }
    }
    
    func checkCameraPermission(completion: @escaping (Bool) -> Void) {
        let status = AVCaptureDevice.authorizationStatus(for: .video)
        switch status {
        case .authorized:
            completion(true)
        case .denied, .restricted:
            //            self.alert.show()
            completion(false)
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video) { (granted) in
                completion(granted)
            }
        @unknown default:
            //            self.alert.show()
            completion(false)
        }
    }
    
    func checkPhotoPermission(completion: @escaping (Bool) -> Void) {
        let status = PHPhotoLibrary.authorizationStatus()
        switch status {
        case .authorized:
            completion(true)
        case .denied, .restricted:
            //            self.alert.show()
            completion(false)
        case .notDetermined:
            PHPhotoLibrary.requestAuthorization { newStatus in
                if newStatus == PHAuthorizationStatus.authorized {
                    completion(true)
                } else {
                    completion(false)
                }
            }
        case .limited:
            completion(true)
        @unknown default:
            //            self.alert.show()
            completion(false)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            print("Selected Image: \(image)")
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
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
