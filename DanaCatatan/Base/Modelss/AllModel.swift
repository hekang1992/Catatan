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
    var cleaved: String?
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
    var galloped: String?
    var app_name: String?
    
    var incomes: [IncomesModel]?
    var circumstance: CircumstanceModel?
    var blouses: BlousesModel?
    var commented: CommentedModel?
    var checked: CheckedModel?
    var craved: [CravedModel]?
    var released: ReleasedModel?
    var monthss: [String]?//月份
    var investment: [Double]?
    var liabilities: [Double]?
    var current: [Double]?
    var fixed: [Double]?
    var selling: SellingModel?
}

class ReleasedModel: HandyJSON {
    required init() {
    }
    var incomes: [IncomesModel]?
    var alternate_phone: String?
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
    var chests: String?
    var signify: String?
    var grievous: String?
}

class DrawingModel: HandyJSON {
    required init() {
    }
    var tradition: String?
    var plumb: String?
    var auctions: String?
    var managers: String?
    var dreary: String?
    var given: String?
    var ashamed: String?
    var promulgate: String?
    var deceptions: String?
    var falsehoods: String?
    var favors: String?
    var occurred: String?
    var tedious: String?
    var masters: String?
    var downcast: String?
}

class SellingModel: HandyJSON {
    required init() {
    }
    var managers: String?
    var plantation: String?
    var reckon: String?
}

class CircumstanceModel: HandyJSON {
    required init() {
    }
    var picture: String?
}

class CravedModel: HandyJSON {
    required init() {
    }
    var tradition: String?
    var grimy, emancipation, blaspheming: Int?
    var brick: String?//cell类型
    var waiters: String?//title
    var paced: String?//placeHolder
    var awareness: String?//key
    var borne: Int?//是否是数字键盘
    var customers: [CustomerModel]?
    var prime: String?//用户选择的值
    var lives: String?//用户选择的key
    
    var saveStr: String?
}

class CustomerModel: HandyJSON {
    required init() {
    }
    var conjured: String?
    var lives: String?
}

class IncomesModel: HandyJSON {
    required init() {
    }
    var lives: String?
    var awareness: String?
    var conjured: String?
    var ensued: String?
    var female: String?
    var scuffle: String?
    var yearly: String?
    var saveStr: String?
    
    var scars: String?
    var plumb: String?
    var auctions: String?
    var barrister: String?
    var merchandise: String?
    var downcast: String?
    var coffle: String?
    var josiah: String?
    var gestured: String?
    var whether: String?
    var masters: String?
    var growled: String?
    var managers: String?
    var untoward: String?
    var inquisitiveness: String?
    var notices: String?
    var correct: String?
    var showText: String?
    
    var addressname: String?
    var flying: String?
    var school: String?
    var chests: String?
    var hooves: String?
    var property: String?
    var enfolding: String?//orderid
    var effect: String?
    var knobby: String?
    var matched: String?
    var distributes: String?
    var dreary: String?
    var tradition: String?
    
    var bandanas: [BandanasModel]?
    var drawing: [DrawingModel]?
    var frantic: [CustomerModel]?
}

class BandanasModel: HandyJSON {
    required init() {
    }
    var awareness: String?
    var conjured: String?
    var bandanas: [BandanasModel]?
}

struct ContactModel {
    var conjured: String
    var grieving: [String]
    var balanced: [String]
}
