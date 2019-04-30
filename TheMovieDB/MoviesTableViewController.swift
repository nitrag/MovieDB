//
//  MoviesTableViewController.swift
//  TheMovieDB
//
//  Created by Ryan Gartin on 4/29/19.
//  Copyright © 2019 Ryan Gartin. All rights reserved.
//

import UIKit

class MoviesTableViewController: UITableViewController {
    
    var movies = [Movie]() {
        didSet {
            self.tableView.reloadData()
        }
    }

    
    var category: MovieDBCategory = .NowPlaying
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(MovieTableViewCell.self, forCellReuseIdentifier: "movieCell")

        self.title = category.rawValue
        self.navigationController?.title = category.rawValue
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.loadMovies()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return movies.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as! MovieTableViewCell
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
}
