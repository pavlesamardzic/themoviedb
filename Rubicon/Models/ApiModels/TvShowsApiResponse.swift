//
//  TvShowsApiResponse.swift
//  Rubicon
//
//  Created by Pavle on 21.6.18..
//  Copyright © 2018. Pavle. All rights reserved.
//


import Foundation
import ObjectMapper

class TvShowsApiResponse: BaseApiResponse {
    var results: [ApiTVShows]? = nil
    
    override func mapping(map: Map) {
        results <- map["results"]
    }
}

