//
//  APIClient.swift
//  TheMovieDB
//
//  Created by Ryan Gartin on 4/29/19.
//  Copyright © 2019 Ryan Gartin. All rights reserved.
//

import Foundation

class APIClient: NSObject {
    
    static let shared: APIClient = {
        let instance = APIClient()
        return instance
    }()
    
    private override init() {}

    let apiURL = AppConfig.API.movieAPIURL
    let apiKey = "?api_key=\(AppConfig.Keys.movieAPIKey)"
    let imageURL = AppConfig.API.movieImageBaseURL
    
    
}
