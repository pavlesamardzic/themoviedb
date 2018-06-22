//
//  BaseApiResponse.swift
//  Rubicon
//
//  Created by Pavle on 21.6.18..
//  Copyright © 2018. Pavle. All rights reserved.
//

import Foundation
import ObjectMapper

class BaseApiResponse: Mappable {
    var page: Int = 0
    var total_results: Int = 0
    var total_pages: Int = 0
    
    required init?(map: Map){}
    
    func mapping(map: Map) {
        page <- map["page"]
        total_results <- map["total_results"]
        total_pages <- map["total_pages"]
    }
}
