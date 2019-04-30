//
//  MovieViewController.swift
//  TheMovieDB
//
//  Created by Ryan Gartin on 4/29/19.
//  Copyright © 2019 Ryan Gartin. All rights reserved.
//

import UIKit
import SDWebImage

class MovieViewController: UIViewController, Storyboarded {

    
    @IBOutlet weak var backdropImageView: UIImageView!
    
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieDescription: UILabel!
    
    @IBOutlet weak var releaseLabel: UILabel!
    
    var movie: Movie!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        movieTitle.text = movie.title
        movieDescription.text = movie.overview
        backdropImageView.sd_setImage(with: movie.getBackgroupURL(), completed: nil)
        
        let dateformater = DateFormatter()
        dateformater.dateStyle = .medium
        dateformater.timeStyle = .none
        releaseLabel.text = dateformater.string(from: movie.releaseDate)
    }
    
}
