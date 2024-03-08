//
//  AllModel.swift
//  Catatan
//
//  Created by apple on 2024/3/4.
//

import Foundation
import HandyJSON

class BaseModel: HandyJSON {
    required init() {
    }
    var awareness: Int?
    var edges: String?
    var hovered: [String: Any]?
}

class HoveredModel: HandyJSON {
    required init() {
    }
    var occurred: String?
    var lives: String?
    var decades: String?//appid
    var trapped: String?
    var seizes: String?
    var conjured: String?
    var pawed: String?
    var locked: String?
    var postmaster: String?//电话
    var square: String?//日
    var ogling: String?//月
    var buyers: String?//年
    
    var incomes: [IncomesModel]?
    var circumstance: CircumstanceModel?
    var blouses: BlousesModel?
    var commented: CommentedModel?
    var checked: CheckedModel?
    var craved: [CravedModel]?
}

class CommentedModel: HandyJSON {//身份证
    required init() {
    }
    var occurred: String?//url
    var emancipation: String?//是否通过
}

class CheckedModel: HandyJSON {//人脸
    required init() {
    }
    var occurred: String?//url
    var emancipation: String?//是否通过
}

class BlousesModel: HandyJSON {
    required init() {
    }
    var hardworking: String?//order ID
}

class DrawingModel: HandyJSON {
    required init() {
    }
    var tradition: Int?
    var plumb: String?
    var auctions: String?
    var managers: String?
    var dreary: String?
    var given: String?
    var ashamed: String?
    var promulgate: String?
    var deceptions: String?
    var falsehoods: String?
}

class CircumstanceModel: HandyJSON {
    required init() {
    }
    var picture: String?
}

class CravedModel: HandyJSON {
    required init() {
    }
    var tradition, prime, lives: String?
    var grimy, emancipation, blaspheming: Int?
    var brick: String?//cell类型
    var waiters: String?//title
    var paced: String?//placeHolder
    var awareness: String?//key
    var borne: Int?//是否是数字键盘
    var customers: [CustomerModel]?
    
    var saveStr: String?
}

class CustomerModel: HandyJSON {
    required init() {
    }
    var conjured: String?
    var lives: Int?
}

class IncomesModel: HandyJSON {
    required init() {
    }
    var lives: String?
    var awareness: String?
    var conjured: String?
    var bandanas: [BandanasModel]?
    var drawing: [DrawingModel]?
}

class BandanasModel: HandyJSON {
    required init() {
    }
    var awareness: String?
    var conjured: String?
    var bandanas: [BandanasModel]?
}
