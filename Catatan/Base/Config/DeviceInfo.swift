//
//  DeviceInfo.swift
//  Catatan
//
//  Created by apple on 2024/2/28.
//

import UIKit
import DeviceKit
import SystemServices
import SystemConfiguration
import SAMKeychain
import AdSupport
import CoreTelephony
import SystemConfiguration.CaptiveNetwork

class DeviceInfo: NSObject {
    
    static func patience() -> String {
        let freeDisk:CLongLong = SystemServices.shared().longFreeDiskSpace
        let patience = String(format: "%.2lld", freeDisk)
        return patience
    }
    
    static func lists() -> String {
        let allDisk:CLongLong = SystemServices.shared().longDiskSpace
        let lists = String(format: "%.2lld", allDisk)
        return lists
    }
    
    static func disposed() -> String {
        let allmem:Double = SystemServices.shared().totalMemory
        let disposed = String(format: "%.0f", allmem * 1024 * 1024)
        return disposed
    }
    
    static func minute() -> String {
        let freemem:Double = SystemServices.shared().freeMemoryinRaw
        let minute = String(format: "%.0f", freemem * 1024 * 1024)
        return minute
    }
    
    static func angles() -> Int {
        let chare:Int = Device.current.batteryLevel!
        return chare
    }
    
    static func bulletins() -> String {
        var ifCharge : String = "0"
        if UIDevice.current.batteryState == .charging || UIDevice.current.batteryState == .full {
            ifCharge = "1"
        }
        return ifCharge
    }
    
    static func column() -> String {
        let column = Device.current.systemVersion
        return column!
    }
    
    static func crimson() -> String {
        let crimson = Device.current.name
        return crimson!
    }
    
    static func perilous() -> String {
        let crimson = Device.current.description
        return crimson
    }
    
    static func arrived() -> String {
        let arrived = String.init(format: "%.0f",SCREEN_WIDTH)
        return arrived
    }
    
    static func streamed() -> String {
        let streamed = String.init(format: "%.0f",SCREEN_HEIGHT)
        return streamed
    }
    
    static func trousers() -> String {
        let trousers = String(Device.current.diagonal)
        return trousers
    }
    
    static func coats() -> String {
        return "100"
    }
    
    static func nines() -> String {
        return "7"
    }
    
    static func gentlemen() -> String {
        return Device.current.isSimulator ? "1" : "0"
    }
    
    static func bowlers() -> String {
        return String(SSJailbreakCheck.jailbroken())
    }
    
    static func street() -> String {
        let currentTimeZone = TimeZone.current
        return currentTimeZone.identifier
    }
    
    static func steps() -> String {
        var steps:String = "0"
        let isUsingDProxy = isUsingProxy()
        if isUsingDProxy {
            steps = "1"
        }
        return steps
    }
    
    static func milled() -> String {
        var milled:String = "0"
        let isVPNDConnected = isVPNConnected()
        if isVPNDConnected {
            milled = "1"
        }
        return milled
    }
    
    static func dressed() -> String {
        return SSCarrierInfo.carrierName() ?? ""
    }
    
    //ifdv
    static func finely() -> String {
        if let uuid = SAMKeychain.password(forService: keychain_service, account: keychain_account), !uuid.isEmpty {
            return uuid
        } else {
            if let deviceIDFV = UIDevice.current.identifierForVendor?.uuidString {
                let success = SAMKeychain.setPassword(deviceIDFV, forService: keychain_service, account: keychain_account)
                if success {
                    print("获取的UUID is \(deviceIDFV)")
                    return deviceIDFV
                } else {
                    print("保存UUID时出现错误")
                    return ""
                }
            } else {
                return ""
            }
        }
    }
    
    static func cleaved() -> String {
        return SSLocalizationInfo.language() ?? ""
    }
    
    static func courthouse() -> String {
        let courthouse: String = NetworkManager.shared.networkStatusChanged()
        return courthouse
    }
    
    static func neared() -> String {
        return Device.current.isPhone ? "1":"0"
    }
    
    static func station() -> String {
        return SSNetworkInfo.currentIPAddress() ?? ""
    }
    
    //idfa
    static func stroll() -> String {
        return ASIdentifierManager.shared().advertisingIdentifier.uuidString
    }
    
    static func jaunt() -> String {
        return SSNetworkInfo.wiFiBroadcastAddress() ?? ""
    }
    
    static func diversion() -> String {
        return getWiFiSSID() ?? ""
    }
    
    static func blink() -> String {
        return SSNetworkInfo.wiFiBroadcastAddress() ?? ""
    }
    
    static func conjured() -> String {
        return "conjured"
    }
    
    static func isUsingProxy() -> Bool {
        let configuration = URLSessionConfiguration.default
        if let proxySettings = configuration.connectionProxyDictionary {
            return proxySettings.count > 0
        }
        return false
    }
    
    static func isVPNConnected() -> Bool {
        var zeroAddress = sockaddr()
        zeroAddress.sa_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sa_family = sa_family_t(AF_INET)
        guard let defaultRouteReachability = withUnsafePointer(to: &zeroAddress, {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {
                zeroSockAddress in
                SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
            }
        }) else {
            return false
        }
        var flags: SCNetworkReachabilityFlags = []
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags) {
            return false
        }
        let isReachable = flags.contains(.reachable)
        let needsConnection = flags.contains(.connectionRequired)
        return isReachable && !needsConnection
    }
    
    static func getWiFiSSID() -> String? {
        var ssid: String?
        if let interfaces = CNCopySupportedInterfaces() as NSArray? {
            for interface in interfaces {
                if let interfaceInfo = CNCopyCurrentNetworkInfo(interface as! CFString) as NSDictionary? {
                    ssid = interfaceInfo[kCNNetworkInfoKeySSID as String] as? String
                    break
                }
            }
        }
        return ssid
    }
    
    static func deviceDictInfo() -> [String: Any] {
        
        var dict:[String:Any] = ["compassion":"ios"]
        
        dict["seamstress"] = ["patience":patience(),
                              "lists":lists(),
                              "disposed":disposed(),
                              "negroes":"negroes",
                              "minute":minute()]
        
        dict["elbowing"] = ["angles":angles(),
                            "pinned":"pinned",
                            "bulletins":bulletins()]
        
        dict["rippled"] = ["column":column(),
                           "crimson":crimson(),
                           "perilous":perilous(),
                           "arrived":arrived(),
                           "streamed":streamed(),
                           "trousers":trousers()]
        
        dict["slavery"] = [:]
        
        dict["matched"] = ["coats":coats(),
                           "nines":nines(),
                           "gentlemen":gentlemen(),
                           "bowlers":bowlers(),
                           "bobbed":"12",
                           "stovepipe":"123"]
        
        dict["drawls"] = ["street":street(),
                          "steps":steps(),
                          "milled":milled(),
                          "dressed":dressed(),
                          "finely":finely(),
                          "cleaved":cleaved(),
                          "blocks":"en",
                          "hubbub":"abc",
                          "courthouse":courthouse(),
                          "neared":neared(),
                          "station":station(),
                          "stroll":stroll()]
        
        dict["drawls"] = ["street":street(),
                          "steps":steps(),
                          "milled":milled(),
                          "dressed":dressed(),
                          "finely":finely(),
                          "cleaved":cleaved(),
                          "blocks":"en",
                          "hubbub":"abc",
                          "courthouse":courthouse(),
                          "neared":neared(),
                          "station":station(),
                          "stroll":stroll()]
        
        dict["revival"] = ["traveling":[["jaunt":jaunt(),
                                         "diversion":diversion(),
                                         "blink":blink(),
                                         "conjured":conjured(),
                                         "quick":"app"]]]
        
        return dict
    }
    
}
