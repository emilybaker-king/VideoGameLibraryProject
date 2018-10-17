//
//  gameManager.swift
//  VideoGameLibraryProject
//
//  Created by Emily Baker-King on 10/17/18.
//  Copyright © 2018 Emily Baker-King. All rights reserved.
//

import Foundation

class GameManager {
//Shared instance of the GameManager class
    static let sharedInstance = GameManager()

//we are creating a private initializer so that no insatance of this class can be made anywhere else
private init() {
    }
    
    //the array of games that will be used throughout the application
    
    private var gameArray = [Game(title: "Fortnite", genre: "Battle Royale", description: "", rating: "E 10+")]
    
    //function to get the number of games we have
    func getGameCount() -> Int {
        return gameArray.count
    }
    
    
    //function to return a game at a specific index
    func getGame(at index: Int) -> Game {
        return gameArray[index]
    }
    
    
    //function to add a game to the library
    func addGame(game: Game) {
        gameArray.append(game)
    }

}
