//
//  ApiModels.swift
//  Rubicon
//
//  Created by Pavle on 19.6.18..
//  Copyright © 2018. Pavle. All rights reserved.
//

import Foundation
import ObjectMapper

class ApiMovie: Mappable {
    var id: Int = 0
    var title: String = ""
    var overview: String = ""
    var poster_path: String = ""
    
    required public init?(map: Map) {}
    
    required public init?() {}
    
    func mapping(map: Map) {
        id <- map["id"]
        title <- map["title"]
        overview <- map["overview"]
        poster_path <- map["poster_path"]
    }
}
