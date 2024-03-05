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

class LoginModel: HandyJSON {
    required init() {
    }
    var seizes: String?
}

class GoogleModel: HandyJSON {
    required init() {
    }
    var decades: String?//appid
    var trapped: String?
    
}



class HomeModel: HandyJSON {
    required init() {
    }
    var incomes: [IncomesModel]?
    var lives: String?
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
