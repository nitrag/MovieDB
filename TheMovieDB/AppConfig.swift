//
//  AppConfig.swift
//  TheMovieDB
//
//  Created by Ryan Gartin on 4/29/19.
//  Copyright © 2019 Ryan Gartin. All rights reserved.
//

import Foundation
import Alamofire

struct AppConfig {
    
    struct API {
        static let movieAPIURL = "https://api.themoviedb.org/3/"
        static let movieImageBaseURL = "https://image.tmdb.org/t/p/w342"
        static let movieBackdropBaseURL = "https://image.tmdb.org/t/p/w780"
    }
    
    struct Keys {
        static let movieAPIKey = "dd62d037d39dba18b847d32ac5aee13a"
    }
    
    
}

enum MovieDBCategory: String {
    case NowPlaying = "Now Playing"
    case Popular = "Popular"
    case TopRated = "Top Rated"
    case Upcoming = "Upcoming"
}
