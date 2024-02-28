//
//  ApiNetWork.swift
//  Catatan
//
//  Created by apple on 2024/2/28.
//

import UIKit
import Alamofire

class ApiNetWork: NSObject {
    
    typealias CompleteBlock = (Any?) -> Void
    typealias NSErrorBlock = (Error?) -> Void
    
    static let shared = ApiNetWork()
    
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
        var wholeApiUrl = "https://www.baidu.com"
        AF.request(wholeApiUrl, method: method, parameters: params, headers: headers).responseData { response in
            switch response.result {
            case .success(let data):
                // 处理成功的逻辑，解析和使用数据
                print("Received data: \(data)")
                complete(data)
            case .failure(let error):
                // 处理失败的逻辑，显示错误
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
