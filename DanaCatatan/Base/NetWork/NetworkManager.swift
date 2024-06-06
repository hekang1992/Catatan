//
//  NetworkManager.swift
//  Catatan
//
//  Created by apple on 2024/2/28.
//

import Alamofire
import Reachability

class NetworkManager {
    
    enum NetworkStatus {
        case wifi
        case cellular
        case none
    }
    
    var typeStr: String = "NONE"
    
    static let shared = NetworkManager()
    
    private let reachability = try!Reachability()
    
    typealias NetworkStatusHandler = (NetworkStatus) -> Void
    
    private var networkStatusHandler: NetworkStatusHandler?
    
    private init() {
        setupReachability()
    }
    
    private func setupReachability() {
        CNotificationCenter.addObserver(self, selector: #selector(networkStatusChanged), name: .reachabilityChanged, object: reachability)
        do {
            try reachability.startNotifier()
        } catch {
            print("无法开始网络状态监测")
        }
    }
    
    deinit {
        reachability.stopNotifier()
        NotificationCenter.default.removeObserver(self, name: .reachabilityChanged, object: nil)
    }
    
    @objc func networkStatusChanged(){
        if reachability.connection != .unavailable {
            if reachability.connection == .wifi {
                typeStr = "WIFI"
                notifyNetworkStatus(.wifi)
            } else {
                typeStr = "4G/5G"
                notifyNetworkStatus(.cellular)                
            }
        } else {
            typeStr = "Unknown Network"
            notifyNetworkStatus(.none)
        }
    }
    
    func observeNetworkStatus(_ handler: @escaping NetworkStatusHandler) {
        networkStatusHandler = handler
    }
    
    private func notifyNetworkStatus(_ status: NetworkStatus) {
        networkStatusHandler?(status)
    }
    
}
