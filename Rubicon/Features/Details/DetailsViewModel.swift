//
//  DetailsViewModel.swift
//  Rubicon
//
//  Created by Pavle on 18.6.18..
//  Copyright © 2018. Pavle. All rights reserved.
//

import Foundation
import UIKit

protocol DetailsViewProtocol {
    func showMovieById(movie: ApiMovie)
    func showTVShowById(tvShow: ApiTVShows)
    func failedToShowData (error: Error)
}

class DetailsViewModel {
    var output: DetailsViewProtocol?
    var movie: ApiMovie = ApiMovie()!
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
        
        ApiManager().getTvShowById(id: id, success: succeeded, failure: failed)
    }
    
    func getMovie(id: Int){
        let succeeded: (ApiMovie) -> Void = { (data) in
            self.output?.showMovieById(movie: data)
        }
        
        let failed: (Error) -> Void = {(error) in
            self.output?.failedToShowData(error: Error.self as! Error)
        }
        
        ApiManager().getMovieById(id: id, success: succeeded, failure: failed)
    }
    
}
