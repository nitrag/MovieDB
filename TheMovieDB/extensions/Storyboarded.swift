//
//  Storyboarded.swift
//  TheMovieDB
//
//  Created by Ryan Gartin on 4/29/19.
//  Copyright © 2019 Ryan Gartin. All rights reserved.
//
//https://www.hackingwithswift.com/articles/71/how-to-use-the-coordinator-pattern-in-ios-apps

import UIKit

protocol Storyboarded {
    static func instantiate(from storyboard: Storyboards) -> Self
}

enum Storyboards: String {
    case Main
}

extension Storyboarded where Self: UIViewController {
    static func instantiate(from storyboard: Storyboards = .Main) -> Self {
        // this pulls out "MyApp.MyViewController"
        let fullName = NSStringFromClass(self)
        
        // this splits by the dot and uses everything after, giving "MyViewController"
        let className = fullName.components(separatedBy: ".")[1]
        
        // load our storyboard
        let storyboard = UIStoryboard(name: storyboard.rawValue, bundle: Bundle.main)
        
        // instantiate a view controller with that identifier, and force cast as the type that was requested
        return storyboard.instantiateViewController(withIdentifier: className) as! Self
    }
}
