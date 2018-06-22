//
//  DetailsViewController.swift
//  Rubicon
//
//  Created by Pavle on 14.6.18..
//  Copyright © 2018. Pavle. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage

class DetailsViewController: UIViewController, DetailsViewProtocol {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var Description: UITextView!
    
    var id = 0
    var isMovieSelected: Bool = true
    var detailsViewModel: DetailsViewModel? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        detailsViewModel = DetailsViewModel(output: self as! DetailsViewProtocol)
        
        if (isMovieSelected){
            detailsViewModel?.getMovie(id: id)
        } else {
            detailsViewModel?.getTVShow(id: id)
        }
    }
    
    func failedToShowData(error: Error) {
        Alert.init().show("Whoops", message: "Something went wrong! ", buttonText: "Ok", viewController: self)
    }
    
    func showMovieById(movie: ApiMovies) {
        name.text = movie.title
        Description.text = movie.overview
        let url = "https://image.tmdb.org/t/p/w500" + movie.poster_path
        print("image url: " + url)
        image.sd_setImage(with: URL(string: url), placeholderImage: UIImage(named: "placeholder.png"))
    }
    
    func showTVShowById(tvShow: ApiTVShows) {
         name.text = tvShow.name
         Description.text = tvShow.overview
        let url = "https://image.tmdb.org/t/p/w500" + tvShow.poster_path
        print("image url: " + url)
        image.sd_setImage(with: URL(string: url), placeholderImage: UIImage(named: "placeholder.png"))
    }
    
    @IBAction func BackButton (){
        self.dismiss(animated: true, completion: nil)
    }
}
