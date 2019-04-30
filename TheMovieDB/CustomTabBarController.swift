//
//  CustomTabBarController.swift
//  TheMovieDB
//
//  Created by Ryan Gartin on 4/29/19.
//  Copyright © 2019 Ryan Gartin. All rights reserved.
//

import UIKit

class CustomTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nowPlayingNav = UINavigationController()
        nowPlayingNav.tabBarItem = UITabBarItem(title: MovieDBCategory.NowPlaying.rawValue, image: nil, selectedImage: nil)
        let nowPlayingVC = MoviesTableViewController()
        nowPlayingVC.category = .NowPlaying
        nowPlayingNav.addChild(nowPlayingVC)
        
        let popularNav = UINavigationController()
        popularNav.tabBarItem = UITabBarItem(title: MovieDBCategory.Popular.rawValue, image: nil, selectedImage: nil)
        let popularVC = MoviesTableViewController()
        popularVC.category = .Popular
        popularNav.addChild(popularVC)

        let topNav = UINavigationController()
        topNav.tabBarItem = UITabBarItem(title: MovieDBCategory.TopRated.rawValue, image: nil, selectedImage: nil)
        let topVC = MoviesTableViewController()
        topVC.category = .TopRated
        topNav.addChild(topVC)
        
        let upcomingNav = UINavigationController()
        upcomingNav.tabBarItem = UITabBarItem(title: MovieDBCategory.Upcoming.rawValue, image: nil, selectedImage: nil)
        let upcomingVC = MoviesTableViewController()
        upcomingVC.category = .Upcoming
        upcomingNav.addChild(upcomingVC)
        // Do any additional setup after loading the view.
        
        self.viewControllers = [
            nowPlayingNav,
            popularNav,
            topNav,
            upcomingNav
        ]
    }

}
