//
//  MoviesTableViewController.swift
//  TheMovieDB
//
//  Created by Ryan Gartin on 4/29/19.
//  Copyright © 2019 Ryan Gartin. All rights reserved.
//

import UIKit

class MoviesTableViewController: UITableViewController, Storyboarded {
    
    var movies = [Movie]() {
        didSet {
            self.tableView.reloadData()
        }
    }

    let cellId = "movieCell"
    var category: MovieDBCategory = .NowPlaying
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 120
        
        title = category.rawValue
        navigationController?.title = category.rawValue
        
        loadMovies()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! MovieTableViewCell
        cell.setup(movies[indexPath.row])
        return cell
    }

    
    // MARK: - Implementation
    
    func loadMovies() {
        print("Loading movies for \(self.category)")
        APIClient.shared.getMovies(self.category) { movies, error in
            if let error = error {
                print("There was an error loading movies! ")
                print(error)
                return
            }
            self.movies += movies
        }
    }
    
    
    //MARK: - Interaction
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movieVC = MovieViewController.instantiate()
        movieVC.movie = movies[indexPath.row]
        self.navigationController?.pushViewController(movieVC, animated: true)
    }
}
