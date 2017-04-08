//
//  DummyModel.swift
//  MyFirstPerfectProject
//
//  Created by Rana Ranvijay SIngh on 06/04/17.
//
//

import Foundation
import ObjectMapper
class DummyModel: Mappable {
    var id: String?
    var name: String?
    var firstName: String?
    var age:Int?
    var hobbies: [String]?

    required init?(map: Map) {

    }

    func mapping(map: Map) {
        id          <- map["ID"]
        name        <- map["name"]
        firstName   <- map["first-name"]
        age         <- map["age"]
        hobbies     <- map["hobbies"]
    }
}
