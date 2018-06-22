//
//  ApiTVShows.swift
//  Rubicon
//
//  Created by Pavle on 18.6.18..
//  Copyright © 2018. Pavle. All rights reserved.
//

import Foundation
import ObjectMapper

class ApiTVShows: Mappable {
    var id: Int = 0
    var name: String = ""
    var overview: String = ""
    var poster_path: String = ""
    
    required public init?(map: Map) {}
    
    required public init?() {}
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        overview <- map["overview"]
        poster_path <- map["poster_path"]
    }
}
