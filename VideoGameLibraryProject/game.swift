//
//  game.swift
//  VideoGameLibraryProject
//
//  Created by Emily Baker-King on 10/16/18.
//  Copyright © 2018 Emily Baker-King. All rights reserved.
//

import Foundation

class Game {
    var title: String
    var genre: String
    var description: String
    var dueDate: Date?
    var checkedIn: Bool = true
    var rating: String
    
    init(title: String, genre: String, description: String, rating: String) {
        self.title = title
        self.genre = genre
        self.description = description
        self.rating = rating
    }
    
}
