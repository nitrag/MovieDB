//
//  Movie.swift
//  TheMovieDB
//
//  Created by Ryan Gartin on 4/29/19.
//  Copyright © 2019 Ryan Gartin. All rights reserved.
//

import Foundation


struct Movie: Codable {
    
    var title: String
    var posterPath: String
    var overview: String
    
    var voteAverage: Double
    var voteCount: Int
    var popularity: Double
    
    func getURL() -> URL {
        return URL(string: "http://image.tmdb.org/t/p/w185/\(posterPath)")!
    }
    
    private enum CodingKeys: String, CodingKey {
        case title
        case posterPath = "poster_path"
        case overview
        
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case popularity
    }
    
}
