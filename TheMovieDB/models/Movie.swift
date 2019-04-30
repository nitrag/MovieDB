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
    var backdropPath: String?
    var overview: String
    
    var voteAverage: Double
    var voteCount: Int
    var popularity: Double
    var releaseDate: Date
    
    func getImageURL() -> URL {
        return URL(string: AppConfig.API.movieImageBaseURL + posterPath)!
    }
    func getBackgroupURL() -> URL? {
        if let backdropPath = backdropPath {
            return URL(string: AppConfig.API.movieBackdropBaseURL + backdropPath)!
        }
        return nil
    }
    
    private enum CodingKeys: String, CodingKey {
        case title
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
        case overview
        
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case popularity
        case releaseDate = "release_date"
    }
    
}
