//
//  SaveLoginInfo.swift
//  Catatan
//
//  Created by apple on 2024/3/4.
//

import UIKit

class SaveLoginInfo: NSObject {
    static func saveLoginInfo(_ toke: String, _ phone: String) {
        USER_DEFAULTS.set(toke, forKey: LOGIN_SEIZES)
        USER_DEFAULTS.set(phone, forKey: LOGIN_PHONE)
        USER_DEFAULTS.synchronize()
    }
    static func removeLoginInfo() {
        USER_DEFAULTS.removeObject(forKey: LOGIN_SEIZES)
        USER_DEFAULTS.removeObject(forKey: LOGIN_PHONE)
        USER_DEFAULTS.removeObject(forKey: MAIDIAN_ONE)
        USER_DEFAULTS.removeObject(forKey: LOCATION_ONE)
        USER_DEFAULTS.synchronize()
    }
}
