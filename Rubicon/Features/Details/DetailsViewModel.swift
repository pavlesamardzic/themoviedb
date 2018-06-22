//
//  DetailsViewModel.swift
//  Rubicon
//
//  Created by Pavle on 14.6.18..
//  Copyright © 2018. Pavle. All rights reserved.
//

import Foundation
import UIKit

protocol DetailsViewProtocol {
    func showMovieById(movie: ApiMovies)
    func showTVShowById(tvShow: ApiTVShows)
    func failedToShowData (error: Error)
    
}

class DetailsViewModel {
    var output: DetailsViewProtocol?
    var movie: ApiMovies = ApiMovies()!
    var tvShow: ApiTVShows = ApiTVShows()!
    
    init(output: DetailsViewProtocol) {
        self.output = output
    }
    
    func getTVShow(id: Int){
        let succeeded: (ApiTVShows) -> Void = { (data) in
            self.output?.showTVShowById(tvShow: data)
        }
        
        let failed: (Error) -> Void = {(error) in
            self.output?.failedToShowData(error: Error.self as! Error)
        }
        
        TopListManager().getTvShowById(id: id, success: succeeded, failure: failed)
    }
    
    func getMovie(id: Int){
        let succeeded: (ApiMovies) -> Void = { (data) in
            self.output?.showMovieById(movie: data)
        }
        
        let failed: (Error) -> Void = {(error) in
            self.output?.failedToShowData(error: Error.self as! Error)
        }
        
        TopListManager().getMovieById(id: id, success: succeeded, failure: failed)
    }
}
