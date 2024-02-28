//
//  NetApiWork.swift
//  Catatan
//
//  Created by apple on 2024/2/28.
//

import UIKit
import Alamofire

class NetApiWork: NSObject {
    
    typealias CompleteBlock = (Any?) -> Void
    typealias NSErrorBlock = (Error?) -> Void
    
    static let shared = NetApiWork()
    
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
        var wholeApiUrl = BASE_APIURL + pageUrl + "?" + CommonParams.getParas()
        wholeApiUrl = wholeApiUrl.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        AF.request(wholeApiUrl, method: method, parameters: params, headers: headers).responseData { response in
            switch response.result {
            case .success(let data):
                print("Received data: \(data)")
                complete(data)
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
                errorBlock(error.localizedDescription as? Error)
            }
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
