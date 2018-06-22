//
//  DetailsViewController.swift
//  Rubicon
//
//  Created by Pavle on 18.6.18..
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
        detailsViewModel = DetailsViewModel(output: self as DetailsViewProtocol)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        if (isMovieSelected){
            detailsViewModel?.getMovie(id: id)
        } else {
            detailsViewModel?.getTVShow(id: id)
        }
    }
    
    func failedToShowData(error: Error) {
        Alert.init().show("Whoops", message: "Something went wrong! ", buttonText: "Ok", viewController: self)
    }
    
    func showMovieById(movie: ApiMovie) {
        name.text = movie.title
        Description.text = movie.overview
        
        setImage(path: movie.poster_path)
    }
    
    func showTVShowById(tvShow: ApiTVShows) {
        name.text = tvShow.name
        Description.text = tvShow.overview
      
        setImage(path: tvShow.poster_path)
    }
    
    func setImage(path: String){
        let url = "https://image.tmdb.org/t/p/w500" + path
        image.sd_setImage(with: URL(string: url), placeholderImage: UIImage(named: "placeholder.png"))
    }
    
    @IBAction func BackButton (){
        self.dismiss(animated: true, completion: nil)
    }
    
}
