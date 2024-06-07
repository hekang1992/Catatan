//
//  CManager.swift
//  Catatan
//
//  Created by apple on 2024/3/5.
//

import UIKit

class CManager: NSObject {

    static func pageJump(path: String, isVerify: Bool = false, _ type: String)
    {
        if let url = URL(string:path), url.scheme != nil {
            goWeb(path: path, isVerify: isVerify, type)
        } else {
            schemeFoRoute(by: path)
        }
    }
    
    static func goWeb(path: String, isVerify: Bool = false, _ type: String) {
        let vc = CWebViewController()
        vc.type = type
        getCurrentUIVC()?.navigationController?.pushViewController(vc, animated: true)
    }
    
    static func schemeFoRoute(by schemeStr: String) {
        let mapping = CManager.schemeAndParameters(from: schemeStr)
        CManager.mappingSchemeFunc(mapping)
    }
    
    private static func schemeAndParameters(from string: String) -> (function: String?, parameters: [String: String]?) {
        let scheme = "app.dcatan/"
        guard let range = string.range(of: scheme) else {
            print("Scheme is not present in the string.")
            return (nil, nil)
        }
        let funcWithParams = String(string[range.upperBound...])
        let components = funcWithParams.components(separatedBy: "?")
        let functionPart = components.first
        guard components.count > 1, let paramString = components.last else {
            return (functionPart, nil)
        }
        let paramComponents = paramString.split(separator: "&")
        var parameters: [String: String] = [:]
        for component in paramComponents {
            let pair = component.split(separator: "=")
            if pair.count == 2, let key = pair.first, let value = pair.last {
                parameters[String(key)] = String(value)
            }
        }
        return (functionPart, parameters)
    }
    
    private static func mappingSchemeFunc(_ mapping: (function: String?, parameters: [String: String]?)) {
        let funcStr = mapping.function
        let paramValue = mapping.parameters?.first?.value ?? ""
        let curVc = getCurrentUIVC()
        if funcStr == "thinkingAreas" {
            curVc?.tabBarController?.selectedIndex = 1
        } else if funcStr == "himselfBlanket" {
            curVc?.tabBarController?.selectedIndex = 0
        } else if funcStr == "shirtingSouth" {
            curVc?.navigationController?.pushViewController(LoginViewController(), animated: true)
        } else if funcStr == "woodsHaving" {
            let orderVc = OrderViewController()
            orderVc.hideTabBar()
            orderVc.typeStr = paramValue
            curVc?.navigationController?.pushViewController(orderVc, animated: true)
        } else if funcStr == "terrainShoot" {
            let jdVc = JDViewController()
            jdVc.hideTabBar()
            jdVc.bidders = paramValue
            curVc?.navigationController?.pushViewController(jdVc, animated: true)
        } else if funcStr == "fiddledDollars" {
            
        } else {
            
        }
    }
}
