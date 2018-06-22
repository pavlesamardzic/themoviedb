//
//  TableViewCell.swift
//  Rubicon
//
//  Created by Pavle on 20.6.18..
//  Copyright © 2018. Pavle. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage

class TableViewCell: UITableViewCell{
    
    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet weak var RankingLabel: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var overview: UILabel!
    var i = 0
    
    func showMovieData(data: ApiMovie, position: Int) {
        name.text = "\(data.title)"
        overview.text = "\(data.overview)"
        RankingLabel.text = "\(position+1)"
        
        let url = "https://image.tmdb.org/t/p/w200" + data.poster_path
        ImageView.sd_setImage(with: URL(string: url), placeholderImage: UIImage(named: "placeholder.png"))
    }
    
    func showTvShowData(data: ApiTVShows, position: Int) {
        name.text = "\(data.name)"
        overview.text = "\(data.overview)"
        RankingLabel.text = "\(position+1)"
        
        let url = "https://image.tmdb.org/t/p/w200" + data.poster_path
        ImageView.sd_setImage(with: URL(string: url), placeholderImage: UIImage(named: "placeholder.png"))
    }
    
}
