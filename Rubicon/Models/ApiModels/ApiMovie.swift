//
//  ApiMovie.swift
//  Rubicon
//
//  Created by Pavle on 22.6.18..
//  Copyright © 2018. Pavle. All rights reserved.
//

import Foundation
import ObjectMapper

class ApiMovie: Mappable {
    var id: Int = 0
    var title: String = ""
    var overview: String = ""
    
