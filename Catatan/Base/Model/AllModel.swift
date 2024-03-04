//
//  AllModel.swift
//  Catatan
//
//  Created by apple on 2024/3/4.
//

import Foundation
import SwiftyJSON

class LoginModel: NSObject {
    var seizes: String?
    init(jsondata: JSON){
        seizes = jsondata["seizes"].stringValue
    }
}
