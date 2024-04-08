//
//  ContactsManager.swift
//  Catatan
//
//  Created by apple on 2024/3/11.
//

import UIKit
import Contacts
import ContactsUI

typealias ContactsPermissionCompletion = ((Bool) -> Void)

class ContactsManager: NSObject,CNContactPickerDelegate {
    
    static func requestContactsPermission(completion: @escaping ContactsPermissionCompletion) {
        let contactStore = CNContactStore()
        switch CNContactStore.authorizationStatus(for: .contacts) {
        case .authorized:
            // 已经获得通讯录权限
            completion(true)
        case .notDetermined:
            // 请求通讯录权限
            contactStore.requestAccess(for: .contacts, completionHandler: { (granted, error) in
                DispatchQueue.main.async {
                    completion(granted)
                }
            })
        case .denied, .restricted:
            // 用户拒绝或受限制
            completion(false)
        default:
            break
        }
    }
    
    class func showContactPicker(completion: @escaping (String, String, String, String) -> Void) {
        let contactPicker = CNContactPickerViewController()
        contactPicker.delegate = ContactsManager.shared
        ContactsManager.shared.completionHandler = completion
        getCurrentUIVC()?.present(contactPicker, animated: true)
    }
    
    static let shared = ContactsManager()
    
    var completionHandler: ((String, String, String, String) -> Void)?
    func contactPicker(_ picker: CNContactPickerViewController, didSelect contact: CNContact) {
        // 获取联系人信息
        let firstName = contact.givenName
        let lastName = contact.familyName
        let email = contact.emailAddresses.first?.value as? String ?? ""
        let phoneNumber = contact.phoneNumbers.first?.value.stringValue ?? ""
        completionHandler?(firstName, lastName, email, phoneNumber)
    }
    func contactPickerDidCancel(_ picker: CNContactPickerViewController) {
    }
    
}
