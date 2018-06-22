//
//  ApiMovies.swift
//  Rubicon
//
//  Created by Pavle on 15.6.18..
//  Copyright © 2018. Pavle. All rights reserved.
//

import Foundation
import ObjectMapper

class ApiMovies: Mappable {
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


//import Foundation
//
//class ApiMovies: Codable {
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
//    let voteCount, id: Int
//    let video: Bool
//    let voteAverage: Double
//    let title: String
//    let popularity: Double
//    let posterPath: String
//    let originalLanguage: OriginalLanguage
//    let originalTitle: String
//    let genreIDS: [Int]
//    let backdropPath: String
//    let adult: Bool
//    let overview, releaseDate: String
//
//    enum CodingKeys: String, CodingKey {
//        case voteCount = "vote_count"
//        case id, video
//        case voteAverage = "vote_average"
//        case title, popularity
//        case posterPath = "poster_path"
//        case originalLanguage = "original_language"
//        case originalTitle = "original_title"
//        case genreIDS = "genre_ids"
//        case backdropPath = "backdrop_path"
//        case adult, overview
//        case releaseDate = "release_date"
//    }
//
//    init(voteCount: Int, id: Int, video: Bool, voteAverage: Double, title: String, popularity: Double, posterPath: String, originalLanguage: OriginalLanguage, originalTitle: String, genreIDS: [Int], backdropPath: String, adult: Bool, overview: String, releaseDate: String) {
//        self.voteCount = voteCount
//        self.id = id
//        self.video = video
//        self.voteAverage = voteAverage
//        self.title = title
//        self.popularity = popularity
//        self.posterPath = posterPath
//        self.originalLanguage = originalLanguage
//        self.originalTitle = originalTitle
//        self.genreIDS = genreIDS
//        self.backdropPath = backdropPath
//        self.adult = adult
//        self.overview = overview
//        self.releaseDate = releaseDate
//    }
//}
//
//enum OriginalLanguage: String, Codable {
//    case en = "en"
//    case hi = "hi"
//    case it = "it"
//    case ja = "ja"
//}


///////////////////////////////////////////////////
//import Foundation
//import ObjectMapper
//
//class ApiMovies: Mappable {
//    var id: Int = 0
//    var name: String = ""
//    var description: String = ""
//    var image: String = ""
//    var rank: Int = 0
//
//
//    required public init?(map: Map) {}
//
//    required public init?() {}
//
//    func mapping(map: Map) {
//        id <- map["id"]
//        name <- map["name"]
//        description <- map["nickname"]
//        image <- map["email"]
//        rank <- map["created_at"]
//    }
//}
