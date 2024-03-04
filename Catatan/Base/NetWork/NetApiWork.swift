//
//  NetApiWork.swift
//  Catatan
//
//  Created by apple on 2024/2/28.
//

import UIKit
import Alamofire
import SwiftyJSON

class NetApiWork: NSObject {
    
    static let shared = NetApiWork()
    
    typealias CompleteBlock = (BaseModel?) -> Void
    
    typealias NSErrorBlock = (Error?) -> Void
    
    func requestAPI(params: [String: Any]?,
                    pageUrl: String,
                    method: HTTPMethod,
                    timeout: TimeInterval = 20,
                    complete: @escaping CompleteBlock,
                    errorBlock: @escaping NSErrorBlock){
        let headers: HTTPHeaders = [
            "Accept" : "application/json;",
            "Connection" : "keep-alive",
            "Content-Type" : "application/x-www-form-urlencoded;text/json;text/javascript;text/html;text/plain;multipart/form-data"
        ]
        var wholeApiUrl = BASE_URL + pageUrl + "?" + CommonParams.getParas()
        wholeApiUrl = wholeApiUrl.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        AF.request(wholeApiUrl, method: method, parameters: params, headers: headers).responseData { response in
            if response.data == nil {
                print("no data")
                return
            }
            let json = try? JSONSerialization.jsonObject(with: response.data!,options:[.mutableContainers,.mutableLeaves,.fragmentsAllowed])
            let jsonDic = JSON.init(json as Any)
            let model = BaseModel(jsondata: jsonDic)
            complete(model)
        }
    }
    
    func uploadImageAPI(params: [String: Any]?,
                        pageUrl: String,
                        method: HTTPMethod,
                        timeout: TimeInterval = 20,
                        data: Data,
                        complete: @escaping CompleteBlock,
                        errorBlock: @escaping NSErrorBlock){
        
    }
    
    
}
