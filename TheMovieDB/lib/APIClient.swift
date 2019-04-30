//
//  APIClient.swift
//  TheMovieDB
//
//  Created by Ryan Gartin on 4/29/19.
//  Copyright © 2019 Ryan Gartin. All rights reserved.
//

import Foundation
import Alamofire
import CodableAlamofire


class APIClient: NSObject {
    
    static let shared: APIClient = {
        let instance = APIClient()
        return instance
    }()
    
    private override init() {}

    let apiURL = AppConfig.API.movieAPIURL
    let apiCreds = "?api_key=\(AppConfig.Keys.movieAPIKey)"
    let imageURL = AppConfig.API.movieImageBaseURL
    
    lazy var defaultDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .custom { decoder in
            let container = try decoder.singleValueContainer()
            let dateString = try container.decode(String.self)
            
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd"
            if let date = formatter.date(from: dateString) {
                return date
            }
            throw DecodingError.dataCorruptedError(in: container, debugDescription: "Cannot decode date string \(dateString)")
        }
        return decoder
    }()
    
    func getMovies(_ category: MovieDBCategory, completion: @escaping ([Movie], Error?) -> Void) {
        let url = { () -> URL in
            switch category {
            case .NowPlaying:
                return URL(string: apiURL + "movie/now_playing" + apiCreds)!
            case .Popular:
                return URL(string: apiURL + "movie/popular" + apiCreds)!
            case .TopRated:
                return URL(string: apiURL + "movie/top_rated" + apiCreds)!
            case .Upcoming:
                return URL(string: apiURL + "movie/upcoming" + apiCreds)!
            }
        }()
        print("Fetching \(url)")
        Alamofire.request(url).responseDecodableObject(keyPath: "results", decoder: self.defaultDecoder) { (response: DataResponse<[Movie]>) in
            let movies = response.result.value
            if let movies = movies {
                completion(movies, nil)
            }else{
                completion([Movie](), response.result.error)
            }
        }
    }
}
