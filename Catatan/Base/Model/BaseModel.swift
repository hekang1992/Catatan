//
//  BaseModel.swift
//  Catatan
//
//  Created by apple on 2024/2/28.
//

import Foundation
import SwiftyJSON

class BaseModel: NSObject {
    var awareness: Int?
    var edges: String?
    var hovered: JSON? = []
    init(jsondata: JSON){
        awareness = jsondata["awareness"].intValue
        edges = jsondata["edges"].stringValue
        hovered = jsondata["hovered"]
    }
}


