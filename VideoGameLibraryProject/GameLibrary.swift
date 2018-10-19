//
//  GameLibrary.swift
//  VideoGameLibraryProject
//
//  Created by Emily Baker-King on 10/16/18.
//  Copyright © 2018 Emily Baker-King. All rights reserved.
//

import UIKit

class GameLibrary: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var gameListTableView: UITableView!
    
    var currentGame: Game!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return GameManager.sharedInstance.getGameCount()
 
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "gameCell") as! GameTableViewCell
        
        let currentGame = GameManager.sharedInstance.getGame(at: indexPath.row)
        
        cell.titleLabel.text = currentGame.title
        cell.genreLabel.text = currentGame.genre
        cell.ratingLabel.text = currentGame.rating
        
        if currentGame.checkedIn {
            cell.statusView.backgroundColor = UIColor.green
        } else {
            cell.statusView.backgroundColor = UIColor.red
        }
        
        //If the game has a due date, we want to format it into a String and display it on the dueDateLabel
        if let dueDate = currentGame.dueDate {
            cell.dateLabel.text = formatDate(dueDate)
        } else {
            cell.dateLabel.text = ""
        }
        
        
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        //This allows us to return an array of actions a row will have (if any)
        
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete") { (_, _) in
            //remove the game at the current index from the game array
            GameManager.sharedInstance.removeGame(at: indexPath.row)
            //Delete the row from the table view at the current index path.
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        
        let gameForIndex = GameManager.sharedInstance.getGame(at: indexPath.row)
        let title = gameForIndex.checkedIn ? "Check Out" : "Check In"
        
        let checkOutOrInAction = UITableViewRowAction(style: .normal, title: title) { (_, _) in
            GameManager.sharedInstance.checkGameInOrOut(at: indexPath.row)
            tableView.reloadRows(at: [indexPath], with: .fade)
        }
        
        let showEditScreenAction = UITableViewRowAction(style: .normal, title: "Edit"){(_, _) in
            self.currentGame = GameManager.sharedInstance.getGame(at: indexPath.row)
            self.performSegue(withIdentifier: "showEditGameScreen", sender: self)
        }
        
        showEditScreenAction.backgroundColor = UIColor.purple
        
        return [deleteAction, checkOutOrInAction, showEditScreenAction]
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
         tableView.deselectRow(at: indexPath, animated: true)
        self.currentGame = GameManager.sharedInstance.getGame(at: indexPath.row)
        self.performSegue(withIdentifier: "segueToGameDetails", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? EditGameViewController {
            //We need to pass through the Game that we'll be editing
            destination.gameToEdit = currentGame
        } else if let destination = segue.destination as? gameInfo {
            destination.game = currentGame
        }
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //go to another screen and then come back and this function will get called.
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        gameListTableView.reloadData()
    }
    
    
    @IBAction func unwindToGameList(segue: UIStoryboardSegue) {
        
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
