//
//  addGame.swift
//  VideoGameLibraryProject
//
//  Created by Emily Baker-King on 10/16/18.
//  Copyright © 2018 Emily Baker-King. All rights reserved.
//

import UIKit

class addGame: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextView!
    @IBOutlet weak var ratingSegmentController: UISegmentedControl!
    @IBOutlet weak var genrePicker: UIPickerView!
    @IBOutlet weak var submitButton: UIBarButtonItem!
    
    //array holding the genres that the games can have
    let pickerData: [String] = ["Massive Multiplayer Online (MMO)", "Simulations", "Adventure", "Real-Time Strategy (RTS)", "Puzzle", "Action", "Stealth Shooter", "First-Person Shooter (FPS)", "Combat", "Sports", "Role-Playing (RPG)", "Educational", "Battle Royale", "Survival Horror", "Hybrid", "Dance/Rhythm", "Platform", "Shooter"]
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    
    
    //This function is a error alert so when adding a  new game if all of the information isn't there then there will be a error message
    func error() {
        //UIAlert controller
        let errorAlert = UIAlertController(title: "Error", message: "All Fields not filled out. Please fill out all of the fields to add a new game.", preferredStyle: .alert)
        
        //UIAlertAction
        let closeAction = UIAlertAction(title: "Close", style: .default, handler: nil)
        
        //add the action in the alert controller
        errorAlert.addAction(closeAction)
        
        //present alert controller
        self.present(errorAlert, animated: true, completion: nil)
    }
    
    
    
    //this function is for the number of rows in your picker view. example is a date would have 3 rows.
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //this puts your genre array in the picker
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    //this chooses the specific row you want to use
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    
    @IBAction func submitButtonTapped(_ sender: Any) {
        //this checks to make sure there is data in the text fields
        guard let title = titleTextField.text,
            title.trimmingCharacters(in: .whitespacesAndNewlines) != "",
            let gameDescription = descriptionTextField.text,
            gameDescription.trimmingCharacters(in: .whitespacesAndNewlines) != "" else {
                //show an error and return
                error()
                return
        }
        
        //rating for the game based on which segment is selected
        var rating : String!
        
        switch ratingSegmentController.selectedSegmentIndex {
        case 0:
            rating = "E"
        case 1:
            rating = "E10+"
        case 2:
            rating = "T"
        case 3:
            rating = "M"
        case 4:
            rating = "AO"
        default:
            rating = "E"
        }
        
        //get the genre for the game
        let genre = pickerData[genrePicker.selectedRow(inComponent: 0)]
        
        //add a new game
        let newGame = Game(title: title, genre: genre, description: gameDescription, rating: rating)
        
        GameManager.sharedInstance.addGame(game: newGame)
        
        
        
        self.performSegue(withIdentifier: "unwindToGameList", sender: self)
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

