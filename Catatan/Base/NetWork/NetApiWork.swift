//
//  NetApiWork.swift
//  Catatan
//
//  Created by apple on 2024/2/28.
//

import UIKit
import Alamofire
import HandyJSON

class NetApiWork: NSObject {
    
    static let shared = NetApiWork()
    
    typealias CompleteBlock = (BaseModel) -> Void
    
    typealias NSErrorBlock = (Error) -> Void
    
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
        print("wholeApiUrl>>>>>>\(wholeApiUrl)")
        AF.request(wholeApiUrl, method: method, parameters: params, headers: headers).responseData { [weak self] response in
      
            switch response.result {
            case .success(let success): 
                if response.data == nil {
                    print("no data")
                    return
                }
                let jsonStr = NSString(data:response.data! ,encoding: String.Encoding.utf8.rawValue)
                let model = JSONDeserializer<BaseModel>.deserializeFrom(json: jsonStr as String?)
                if model?.awareness == 0 || model?.awareness == 00 {
                    complete(model!)
                }else if model?.awareness == -2 {
                    self?.showLoginVc()
                }else{
                    
                }
                break
                
            case .failure(let failure): 
                errorBlock(failure)
                break
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
    
    func showLoginVc (){
        let loginVc = LoginViewController()
        let vc = getCurrentUIVC()!
        let nav = BaseNavViewController(rootViewController: loginVc)
        vc.present(nav, animated: true)
    }
}
