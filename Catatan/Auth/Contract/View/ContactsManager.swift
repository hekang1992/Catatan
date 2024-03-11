//
//  ContactsManager.swift
//  Catatan
//
//  Created by apple on 2024/3/11.
//

import UIKit
import Contacts

typealias ContactsPermissionCompletion = (Bool) -> Void

class ContactsManager: NSObject {
    
    static func requestContactsPermission(completion: @escaping ContactsPermissionCompletion) {
        
        let contactStore = CNContactStore()
        
        switch CNContactStore.authorizationStatus(for: .contacts) {
        case .authorized:
            // 已经获得通讯录权限
            completion(true)
        case .notDetermined:
            // 请求通讯录权限
            contactStore.requestAccess(for: .contacts, completionHandler: { (granted, error) in
                completion(granted)
            })
        case .denied, .restricted:
            // 用户拒绝或受限制
            completion(false)
        default:
            break
        }
    }
    
    static func getAllContacts() -> [ContactModel] {
        var contactsArray: [ContactModel] = []
        let contactStore = CNContactStore()
        requestContactsPermission { (granted) in
            if granted {
                let keysToFetch = [CNContactGivenNameKey, CNContactFamilyNameKey, CNContactPhoneNumbersKey]
                let fetchRequest = CNContactFetchRequest(keysToFetch: keysToFetch as [CNKeyDescriptor])
                do {
                    try contactStore.enumerateContacts(with: fetchRequest) { (contact, stop) in
                        var phoneNumbers: [String] = []
                        for phoneNumber in contact.phoneNumbers {
                            let value = phoneNumber.value.stringValue
                            phoneNumbers.append(value)
                        }
                        let newContact = ContactModel(givenName: contact.givenName, familyName: contact.familyName, phoneNumbers: phoneNumbers)
                        contactsArray.append(newContact)
                    }
                } catch {
                    print("Error fetching contacts: \(error)")
                }
            } else {
                print("未获得通讯录权限")
            }
        }
        return contactsArray
    }
}
