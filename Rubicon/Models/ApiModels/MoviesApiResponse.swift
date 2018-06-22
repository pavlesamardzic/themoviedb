//
//  ApiResponse.swift
//  Rubicon
//
//  Created by Pavle on 21.6.18..
//  Copyright © 2018. Pavle. All rights reserved.
//

import Foundation
import ObjectMapper

class MoviesApiResponse: BaseApiResponse {
    var results: [ApiMovies]? = nil
    
    override func mapping(map: Map) {
        results <- map["results"]
    }
}
