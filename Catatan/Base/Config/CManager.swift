//
//  CManager.swift
//  Catatan
//
//  Created by apple on 2024/3/5.
//

import UIKit

class CManager: NSObject {

    static func pageJump(path: String, isVerify: Bool = false)
    {
        if let url = URL(string:path), url.scheme != nil {
            goWeb(path: path, isVerify: isVerify)
        } else {
            schemeFoRoute(by: path)
        }
    }
    
    static func goWeb(path: String, isVerify: Bool = false) {
        let vc = CWebViewController()
        getCurrentUIVC()?.navigationController?.pushViewController(vc, animated: true)
    }
    
    static func schemeFoRoute(by schemeStr: String) {
        
    }
    
}
