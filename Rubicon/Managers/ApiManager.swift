//
//  TVShowManager.swift
//  Rubicon
//
//  Created by Pavle on 18.6.18..
//  Copyright © 2018. Pavle. All rights reserved.
//

import Foundation

class ApiManager {
    let networkService: Any? = nil
    
    // movies
    func getMoviesTopList(success: @escaping (MoviesApiResponse)->(), failure: @escaping (Error)->()) {
        let networkService = MovieService()
        networkService.getTopRatedMovies(succeededRequest: success, failedRequest: failure)
    }
    
    func getMovieById(id: Int, success: @escaping (ApiMovie)->(), failure: @escaping (Error)->()) {
        let networkService = MovieService()
        networkService.getMovieById(id: id, succeededRequest: success, failedRequest: failure)
    }
    
    func getMoviesByQuery(query: String, success: @escaping (MoviesApiResponse)->(), failure: @escaping (Error)->()) {
        let networkService = MovieService()
        networkService.getMoviesByQuery(query: query, succeededRequest: success, failedRequest: failure)
    }
    
    // tv shows
    func getTVShowTopList(success: @escaping (TvShowsApiResponse)->(), failure: @escaping (Error)->()) {
        let networkService = TVShowService()
        networkService.getTopRatedTVShows(succeededRequest: success, failedRequest: failure)
    }
    
    func getTvShowById(id: Int, success: @escaping (ApiTVShows)->(), failure: @escaping (Error)->()) {
        let networkService = TVShowService()
        networkService.getTvShowById(id: id, succeededRequest: success, failedRequest: failure)
    }
    
    func getTvShowByQuery(query: String, success: @escaping (TvShowsApiResponse)->(), failure: @escaping (Error)->()) {
        let networkService = TVShowService()
        networkService.getTVShowsByQuery(query: query, succeededRequest: success, failedRequest: failure)
    }
}
