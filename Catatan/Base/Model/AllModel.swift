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
    var incomes: [IncomesModel]?
    var circumstance: CircumstanceModel?
    var conjured: String?
    var pawed: String?
    var square: String?//日
    var ogling: String?//月
    var buyers: String?//年
}

class IncomesModel: HandyJSON {
    required init() {
    }
    var lives: String?
    var drawing: [DrawingModel]?
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
