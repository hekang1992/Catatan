//
//  CommonParams.swift
//  Catatan
//
//  Created by apple on 2024/2/28.
//

import UIKit
import DeviceKit

class CommonParams: NSObject {
    
    static func getParas() -> String{
        let dealt: String = "ios"
        let tombstone: String = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as! String
        let bring: String = Device.current.name ?? ""
        let trash: String = DeviceInfo.finely()
        let pitched: String = DeviceInfo.column()
        let decades: String = "app-flexi"
        let seizes: String = USER_DEFAULTS.object(forKey: LOGIN_SEIZES) as? String ?? ""
        let urgency: String = DeviceInfo.finely()
        let cleaved: String = "uu"
        let lastUrl: String = "dealt=\(dealt)&tombstone=\(tombstone)&bring=\(bring)&trash=\(trash)&pitched=\(pitched)&decades=\(decades)&seizes=\(seizes)&urgency=\(urgency)&cleaved=\(cleaved)"
        return lastUrl
    }
}
