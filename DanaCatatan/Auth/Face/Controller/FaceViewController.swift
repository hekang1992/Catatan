//
//  FaceViewController.swift
//  Catatan
//
//  Created by apple on 2024/2/29.
//

import UIKit
import TYAlertController
import AVFoundation
import Photos
import Kingfisher
import HandyJSON
import MBProgressHUD_WJExtension

class FaceViewController: BaseViewController, UIImagePickerControllerDelegate {
    
    var typeFace: String = "11"//身份证正面
    
    var bidders: String = ""
    
    var hardworking: String = ""
    
    var emancipation: String = "0"
    
    var imageFace: UIImage?
    
    let imagePicker = UIImagePickerController()
    
    var startTime1: String?
    
    var startTime2: String?
    
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
            self?.wanLiuAuthView("Apakah Anda yakin ingin menyerah pada permohonan pinjaman ini?")
        }
        view.insertSubview(faceViwe, belowSubview: navView)
        faceViwe.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }
        faceViwe.block1 = { [weak self] in
            self?.typeFace = "11"
            self?.startTime1 = String(Int(Date().timeIntervalSince1970))
            self?.popPhotoView()
        }
        faceViwe.block2 = { [weak self] in
            self?.typeFace = "10"
            self?.startTime2 = String(Int(Date().timeIntervalSince1970))
            self?.popCameraView()
        }
        faceViwe.block3 = { [weak self] in
            self?.nextVc()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addHudView()
        getPeropleInfo()
    }
    
    func getPeropleInfo() {
        let dict = ["bidders":bidders]
        NetApiWork.shared.requestAPI(params: dict, pageUrl: shackledPenetrate, method: .get) { [weak self] baseModel in
            let hovered = baseModel.hovered
            let awess = baseModel.awareness
            if awess == 0 || awess == 00 {
                let model = JSONDeserializer<HoveredModel>.deserializeFrom(dict: hovered)
                let emancipation = model?.checked?.emancipation
                let occurred: String = model?.commented?.occurred ?? ""
                if occurred.isEmpty {
                    self?.faceViwe.mainBtn.isEnabled = true
                }else{
                    let url = URL(string: occurred)
                    self?.faceViwe.mainBtn.kf.setImage(with: url, for: .normal, placeholder: UIImage(named: "abc3"))
                    self?.faceViwe.mainBtn.isEnabled = false
                }
                self?.emancipation = emancipation ?? "0"
            }
            self?.removeHudView()
        } errorBlock: { [weak self] error in
            self?.removeHudView()
        }
    }
    
    func nextVc() {
        if self.emancipation == "0"{
            MBProgressHUD.wj_showPlainText("Silakan unggah informasi ID Anda.", view: nil)
        }else{
            getProductDetailInfo(bidders, "" ,"")
        }
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
        openPhotoLibrary()
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
            self.wanLiuView("Tidak mendapat izin tersebut, apakah ingin pergi ke pengaturan?")
            completion(false)
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video) { (granted) in
                completion(granted)
            }
        @unknown default:
            self.wanLiuView("Tidak mendapat izin tersebut, apakah ingin pergi ke pengaturan?")
            completion(false)
        }
    }
    
    func checkPhotoPermission(completion: @escaping (Bool) -> Void) {
        let status = PHPhotoLibrary.authorizationStatus()
        switch status {
        case .authorized:
            completion(true)
        case .denied, .restricted:
            self.wanLiuView("Anda belum memberikan izin akses ke galeri. Silakan pergi ke pengaturan.")
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
            self.wanLiuView("Anda belum memberikan izin akses ke galeri. Silakan pergi ke pengaturan.")
            completion(false)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        let data = Data.compressQuality(image: image!, maxLength: 1024)
        picker.dismiss(animated: true) { [weak self] in
            self?.setUpLoadImage(data!,image!)
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func setUpLoadImage(_ data: Data, _ image: UIImage) {
        addHudView()
        let lives = self.typeFace
        let pinched = "1"
        let bidders = bidders
        let dict = ["lives":lives,"pinched":pinched,"bidders":bidders]
        NetApiWork.shared.uploadImageAPI(params: dict, pageUrl: enoughGiven, method: .post, data: data) { [weak self] baseModel in
            let edges = baseModel.edges
            let awess = baseModel.awareness
            if awess == 0 || awess == 00 {
                let model = JSONDeserializer<HoveredModel>.deserializeFrom(dict: baseModel.hovered)
                self?.imageFace = image
                if self?.typeFace == "11" {
                    self?.selectFaceView(model!, image)
                }else{
                    self?.faceViwe.mainBtn1.setImage(image, for: .normal)
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                        self?.maidian(productID: self?.bidders ?? "", startTime: self?.startTime1 ?? "", type: "5", orderID: self?.hardworking ?? "")
                        self?.getPeropleInfo()
                    }
                }
            }
            self?.removeHudView()
        } errorBlock: { [weak self] error in
            self?.removeHudView()
            print("error>>>>>>>\(error)")
        }
    }
    
    func selectFaceView(_ model: HoveredModel, _ image: UIImage) {
        let selView = FaceSelectView(frame: self.view.bounds)
        selView.model = model
        selView.bgImageView1.image = image
        let alertVc = TYAlertController(alert: selView, preferredStyle: .actionSheet)
        self.present(alertVc!, animated: true)
        selView.block1 = { [weak self] name,phone,dateTime in
            self?.dismiss(animated: true,completion: {
                self?.saveInfo(name,phone,dateTime)
            })
        }
        selView.block2 = { [weak self] in
            self?.dismiss(animated: true)
        }
    }
    
    func saveInfo(_ name: String, _ ktp: String, _ dateTime: String) {
        addHudView()
        let dict = ["locked":dateTime,"pawed":ktp,"conjured":name,"bidders":bidders,"warehouse":hardworking]
        NetApiWork.shared.requestAPI(params: dict, pageUrl: spendMarched, method: .post) { [weak self] baseModel in
            let awess = baseModel.awareness
            let edges = baseModel.edges
            if awess == 0 || awess == 00 {
                self?.faceViwe.mainBtn.setImage(self?.imageFace, for: .normal)
                self?.maidian(productID: self?.bidders ?? "", startTime: self?.startTime1 ?? "", type: "3", orderID: self?.hardworking ?? "")
            }
            self?.removeHudView()
            MBProgressHUD.wj_showPlainText(edges ?? "", view: nil)
        } errorBlock: { [weak self] error in
            self?.removeHudView()
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
