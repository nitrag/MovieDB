//
//  MovieTableViewCell.swift
//  TheMovieDB
//
//  Created by Ryan Gartin on 4/29/19.
//  Copyright © 2019 Ryan Gartin. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieDescription: UILabel!
    @IBOutlet weak var movieRating: UILabel!
    

    func setup(_ movie: Movie){
        self.movieTitle.text = movie.title
        //self.movieImageView.sd
        self.movieDescription.text = movie.overview
        self.movieRating.text = "\(movie.voteAverage)/10 (\(movie.voteCount))"
    }

}
