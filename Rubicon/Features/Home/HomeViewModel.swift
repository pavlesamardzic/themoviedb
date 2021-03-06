//
//  HomeViewModel.swift
//  Rubicon
//
//  Created by Pavle on 21.6.18..
//  Copyright © 2018. Pavle. All rights reserved.
//

import Foundation
import UIKit

protocol HomeViewProtocol {
    func showMovieData(movies: Array<ApiMovie>)
    func showTVShowData(tvShows: Array<ApiTVShows>)
    
    func showMoviesSearchResult(movies: Array<ApiMovie>)
    func showTvShowSearchResult(tvShows: Array<ApiTVShows>)
    
    func failedToShowData (error: String)
}

class HomeViewModel {
    var output: HomeViewProtocol?
    var movies: Array<ApiMovie> = Array<ApiMovie>()
    var tvShows: Array<ApiTVShows> = Array<ApiTVShows>()
    var searchResultMovies: Array<ApiMovie> = Array<ApiMovie>()
    var searchResultTvShows: Array<ApiTVShows> = Array<ApiTVShows>()
    var valueToPass: Int = 0
    var isMovieSelected: Bool = true
    var listSize: Int = 0;
    
    init(output: HomeViewProtocol) {
        self.output = output
    }
    
    func getTVShowTopList(){
        let succeeded: (TvShowsApiResponse) -> Void = { (data) in
            var topTenTvShows = Array<ApiTVShows>()
            for i in 0..<10 {
                topTenTvShows.append(data.results![i])
            }
            self.listSize = topTenTvShows.count
            self.tvShows = data.results!
            self.output?.showTVShowData(tvShows: topTenTvShows)
        }
        
        let failed: (Error) -> Void = {(error) in
            self.output?.failedToShowData(error: error.localizedDescription)
        }
        
        ApiManager().getTVShowTopList(success: succeeded, failure: failed)
    }
    
    func getMoviesTopList(){
        let succeeded: (MoviesApiResponse) -> Void = { (data) in
            var topTenMovies = Array<ApiMovie>()
            for i in 0..<10 {
                topTenMovies.append(data.results![i])
            }
            self.listSize = topTenMovies.count
            self.movies = topTenMovies
            self.output?.showMovieData(movies: topTenMovies)
        }
        
        let failed: (Error) -> Void = {(error) in
            self.output?.failedToShowData(error: error.localizedDescription)
        }
        
        ApiManager().getMoviesTopList(success: succeeded, failure: failed)
    }
    
    func searchMovies(query: String){
        let succeeded: (MoviesApiResponse) -> Void = { (data) in
            self.searchResultMovies = data.results!
            self.listSize = data.results!.count
            self.output?.showMoviesSearchResult(movies: self.movies)
        }
        
        let failed: (Error) -> Void = {(error) in
            self.output?.failedToShowData(error: error.localizedDescription)
        }
        
        ApiManager().getMoviesByQuery(query: query, success: succeeded, failure: failed)
    }
    
    func searchTvShows(query: String){
        let succeeded: (TvShowsApiResponse) -> Void = { (data) in
            self.searchResultTvShows = data.results!
            self.listSize = data.results!.count
            self.output?.showTvShowSearchResult(tvShows: self.tvShows)
        }
        
        let failed: (Error) -> Void = {(error) in
            print(error.localizedDescription)
            self.output?.failedToShowData(error: error.localizedDescription)
        }
        
        ApiManager().getTvShowByQuery(query: query, success: succeeded, failure: failed)
    }
    
}
