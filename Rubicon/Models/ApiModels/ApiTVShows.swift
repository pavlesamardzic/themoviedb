//
//  ApiTVShows.swift
//  Rubicon
//
//  Created by Pavle on 15.6.18..
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


//import Foundation
//
//class ApiTVShows: Codable {
//    let page, totalResults, totalPages: Int
//    let results: [Result]
//
//    enum CodingKeys: String, CodingKey {
//        case page
//        case totalResults = "total_results"
//        case totalPages = "total_pages"
//        case results
//    }
//
//    init(page: Int, totalResults: Int, totalPages: Int, results: [Result]) {
//        self.page = page
//        self.totalResults = totalResults
//        self.totalPages = totalPages
//        self.results = results
//    }
//}
//
//class Result: Codable {
//    let originalName: String
//    let genreIDS: [Int]
//    let name: String
//    let popularity: Double
//    let originCountry: [OriginCountry]
//    let voteCount: Int
//    let firstAirDate, backdropPath: String
//    let originalLanguage: OriginalLanguage
//    let id: Int
//    let voteAverage: Double
//    let overview, posterPath: String
//
//    enum CodingKeys: String, CodingKey {
//        case originalName = "original_name"
//        case genreIDS = "genre_ids"
//        case name, popularity
//        case originCountry = "origin_country"
//        case voteCount = "vote_count"
//        case firstAirDate = "first_air_date"
//        case backdropPath = "backdrop_path"
//        case originalLanguage = "original_language"
//        case id
//        case voteAverage = "vote_average"
//        case overview
//        case posterPath = "poster_path"
//    }
//
//    init(originalName: String, genreIDS: [Int], name: String, popularity: Double, originCountry: [OriginCountry], voteCount: Int, firstAirDate: String, backdropPath: String, id: Int, voteAverage: Double, overview: String, posterPath: String) {
//        self.originalName = originalName
//        self.genreIDS = genreIDS
//        self.name = name
//        self.popularity = popularity
//        self.originCountry = originCountry
//        self.voteCount = voteCount
//        self.firstAirDate = firstAirDate
//        self.backdropPath = backdropPath
//        self.originalLanguage = originalLanguage
//        self.id = id
//        self.voteAverage = voteAverage
//        self.overview = overview
//        self.posterPath = posterPath
//    }
//}
//
//enum OriginCountry: String, Codable {
//    case de = "DE"
//    case gb = "GB"
//    case jp = "JP"
//    case us = "US"
//}

