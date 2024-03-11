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
    
    typealias NSErrorBlock = (Any) -> Void
    
    func requestAPI(params: [String: Any]?,
                    pageUrl: String,
                    method: HTTPMethod,
                    timeout: TimeInterval = 30,
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
                print("success>>api>>\(success)")
                let jsonStr = NSString(data:response.data! ,encoding: String.Encoding.utf8.rawValue)
                let model = JSONDeserializer<BaseModel>.deserializeFrom(json: jsonStr as String?)
                if model?.awareness == -2 {
                    complete(model!)
                    self?.showLoginVc()
                }else {
                    complete(model!)
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
                        timeout: TimeInterval = 30,
                        data: Data,
                        complete: @escaping CompleteBlock,
                        errorBlock: @escaping NSErrorBlock){
        let headers: HTTPHeaders = [
            "Accept" : "application/json;",
            "Connection" : "keep-alive",
            "Content-Type" : "application/x-www-form-urlencoded;text/json;text/javascript;text/html;text/plain;multipart/form-data;multipart/form-data"
        ]
        var wholeApiUrl = BASE_URL + pageUrl + "?" + CommonParams.getParas()
        wholeApiUrl = wholeApiUrl.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        print("wholeApiUrl>>>>>>\(wholeApiUrl)")
        AF.upload(
            multipartFormData: { multipartFormData in
                multipartFormData.append(data, withName: "slavery", fileName: "slavery.png", mimeType: "image/png")
                if let params = params {
                    for (key, value) in params {
                        let value :String! = value as? String
                        multipartFormData.append(value.data(using: .utf8)!, withName: key)
                    }
                }
            },
            to: wholeApiUrl,headers: headers)
        .validate()
        .responseData(completionHandler: { response in
            switch response.result {
            case .success(let success):
                if response.data == nil {
                    print("no data")
                    return
                }
                print("success>>image>>\(success)")
                let jsonStr = NSString(data:response.data! ,encoding: String.Encoding.utf8.rawValue)
                let model = JSONDeserializer<BaseModel>.deserializeFrom(json: jsonStr as String?)
                complete(model!)
                break
            case .failure(let error):
                errorBlock(error)
                break
            }
        })
    }
    
    func showLoginVc (){
        let loginVc = LoginViewController()
        let vc = getCurrentUIVC()!
        let nav = BaseNavViewController(rootViewController: loginVc)
        nav.modalPresentationStyle = .overFullScreen
        vc.present(nav, animated: true)
    }
}


