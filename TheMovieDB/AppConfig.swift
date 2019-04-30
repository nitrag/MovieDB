//
//  AppConfig.swift
//  TheMovieDB
//
//  Created by Ryan Gartin on 4/29/19.
//  Copyright © 2019 Ryan Gartin. All rights reserved.
//

import Foundation

struct AppConfig {
    
    struct API {
        static let movieAPIURL = "https://api.themoviedb.org/"
        static let movieImageBaseURL = "http://image.tmdb.org/t/p/w185/"
    }
    
    struct Keys {
        static let movieAPIKey = "dd62d037d39dba18b847d32ac5aee13a"
    }
    
}

enum MovieDBCategory {
    case NowPlaying
    case Popular
    case TopRated
    case Upcoming
}
