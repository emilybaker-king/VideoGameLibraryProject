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
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
         tableView.deselectRow(at: indexPath, animated: true)
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
