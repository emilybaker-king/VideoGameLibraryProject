//
//  gameManager.swift
//  VideoGameLibraryProject
//
//  Created by Emily Baker-King on 10/17/18.
//  Copyright © 2018 Emily Baker-King. All rights reserved.
//

import Foundation
import RealmSwift

class GameManager {
//Shared instance of the GameManager class
    static let sharedInstance = GameManager()

//we are creating a private initializer so that no insatance of this class can be made anywhere else
private init() {
    //get all of the objects that are games from our realm database
    gameArray = realm.objects(Game.self)
    }
    
    
    //results container for storing our Game. This functions very similarly to an array or dictionary
    private var gameArray: Results<Game>!
    
    //Tries to create a reference to the local Realm database
    let realm = try! Realm()
    
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
        try! realm.write {
            realm.add(game)
      }
    }
    
    //function to remove a game from the game library
    func removeGame(at index: Int) {
        try! realm.write {
            realm.delete(getGame(at: index))
        }
    }
    
    
    //function to check game in or out
    func checkGameInOrOut(at index: Int) {
        let gameForIndex = gameArray[index]
        
        try! realm.write {
            
            gameForIndex.checkedIn = !gameForIndex.checkedIn
            
            if gameForIndex.checkedIn {
                //Remove any existing due date
                gameForIndex.dueDate = nil
            } else {
                //Add a new due date, since the game has just been checked out
                gameForIndex.dueDate = Calendar.current.date(byAdding: .day, value: 14, to: Date())
            }
        }
        
    }

}
