//
//  TableViewCellModel.swift
//  Rubicon
//
//  Created by Pavle on 21.6.18..
//  Copyright © 2018. Pavle. All rights reserved.
//

//import Foundation
//import UIKit
//
//protocol CellHomeViewProtocol{
//    func showMovieData(data: ApiMovies)
//    func showTVShowData(data: ApiTVShows)
//    func failedToShowData (error: Error)
//}
//
//class TableViewCellModel {
//    var output: CellHomeViewProtocol?
//    var movieData: ApiMovies?
//    var tvShowData: ApiTVShows?
//
//    func getTVShowTopList(){
//        let succeeded: (TvShowsApiResponse) -> Void = { (data) in
//             print("tv show: " + data.results![0].name)
//            self.output?.showTVShowData(data: data.results![0])
//            self.tvShowData = data.results![0]
//        }
//        
//        let failed: (Error) -> Void = {(error) in
//            self.output?.failedToShowData(error: Error.self as! Error)
//        }
//        
//        TopListManager().getTVShowTopList(success: succeeded, failure: failed)
//    }
//    
//    func getMoviesTopList(){
//        let succeeded: (MoviesApiResponse) -> Void = { (data) in
//            print("movie: " + data.results![0].title)
//            self.output?.showMovieData(data: data.results![0])
//            self.movieData = data.results![0]
//        }
//        
//        let failed: (Error) -> Void = {(error) in
//            self.output?.failedToShowData(error: Error.self as! Error)
//        }
//        
//        TopListManager().getMoviesTopList(success: succeeded, failure: failed)
//    }
//}
