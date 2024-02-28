//
//  CommonParamS.swift
//  Catatan
//
//  Created by apple on 2024/2/28.
//

import UIKit
import DeviceKit

class CommonParamS: NSObject {
    
    static func getParas() -> String{
        
        let dealt = "ios"
        
        let tombstone = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as! String
        
        let bring = Device.current.name
        
        let trash = DeviceInfo.finely()
        
        let pitched = DeviceInfo.column()
        
        let decades = "app-flexi"
        
        let seizes = ""
        
        let urgency = DeviceInfo.finely()
        
        let cleaved = "uu"
        
        
        return cleaved
    }
}
