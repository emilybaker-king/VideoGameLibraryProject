//
//  EditGameViewController.swift
//  VideoGameLibraryProject
//
//  Created by Emily Baker-King on 10/18/18.
//  Copyright © 2018 Emily Baker-King. All rights reserved.
//

import UIKit
import RealmSwift

class EditGameViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var gameToEdit: Game!
    
    var ratingEdit: Game!
    
    
    @IBOutlet weak var editGameNameTextField: UITextField!
    @IBOutlet weak var editGameDescriptionTextField: UITextView!
    @IBOutlet weak var editGameRatingSegmentedController: UISegmentedControl!
    @IBOutlet weak var editGameGenrePicker: UIPickerView!
    
    let editPickerData: [String] = ["Massive Multiplayer Online (MMO)", "Simulations", "Adventure", "Real-Time Strategy (RTS)", "Puzzle", "Action", "Stealth Shooter", "First-Person Shooter (FPS)", "Combat", "Sports", "Role-Playing (RPG)", "Educational", "Battle Royale", "Survival Horror", "Hybrid", "Dance/Rhythm", "Platform", "Shooter"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        
        //pull the title of the game you selected
        editGameNameTextField.text = gameToEdit.title
        
        
        //pull the description of the game that they selected
        editGameDescriptionTextField.text = gameToEdit.description
    
        
        //select the rating of the game selected to edit
        switch gameToEdit.rating {
        case "E":
            editGameRatingSegmentedController.selectedSegmentIndex = 0
        case "E10+":
            editGameRatingSegmentedController.selectedSegmentIndex = 1
        case "T":
            editGameRatingSegmentedController.selectedSegmentIndex = 2
        case "M":
            editGameRatingSegmentedController.selectedSegmentIndex = 3
        case "AO":
            editGameRatingSegmentedController.selectedSegmentIndex = 4
        default:
            editGameRatingSegmentedController.selectedSegmentIndex = 0
        }
        
        
        
        //select the genre of the game selected game to edit
        switch gameToEdit.genre {
        case "Massive Multiplayer Online (MMO)":
            editGameGenrePicker.selectRow(0, inComponent: 0, animated: false)
        case "Simulations":
            editGameGenrePicker.selectRow(1, inComponent: 0, animated: false)
        case "Adventure":
            editGameGenrePicker.selectRow(2, inComponent: 0, animated: false)
        case "Real-Time Strategy (RTS)":
            editGameGenrePicker.selectRow(3, inComponent: 0, animated: false)
        case "Puzzle":
            editGameGenrePicker.selectRow(4, inComponent: 0, animated: false)
        case "Action":
            editGameGenrePicker.selectRow(5, inComponent: 0, animated: false)
        case "Stealth Shooter":
            editGameGenrePicker.selectRow(6, inComponent: 0, animated: false)
        case "First-Person Shooter(FPS)":
            editGameGenrePicker.selectRow(7, inComponent: 0, animated: false)
        case "Combat":
            editGameGenrePicker.selectRow(8, inComponent: 0, animated: false)
        case "Sports":
            editGameGenrePicker.selectRow(9, inComponent: 0, animated: false)
        case "Role Playing Game (RPG)":
            editGameGenrePicker.selectRow(10, inComponent: 0, animated: false)
        case "Educational":
            editGameGenrePicker.selectRow(11, inComponent: 0, animated: false)
        case "Battle Royale":
            editGameGenrePicker.selectRow(12, inComponent: 0, animated: false)
        case "Survival Horror":
            editGameGenrePicker.selectRow(13, inComponent: 0, animated: false)
        case "Hybrid":
            editGameGenrePicker.selectRow(14, inComponent: 0, animated: false)
        case "Dance/Rhythm":
            editGameGenrePicker.selectRow(15, inComponent: 0, animated: false)
        case "Platform":
            editGameGenrePicker.selectRow(16, inComponent: 0, animated: false)
        case "Shooter":
            editGameGenrePicker.selectRow(17, inComponent: 0, animated: false)
        default:
            editGameGenrePicker.selectRow(0, inComponent: 0, animated: false)
        }
    }
    
    
    //this function is for the number of rows in your picker view. example is a date would have 3 rows.
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //this puts your genre array in the picker
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return editPickerData.count
    }
    
    //this chooses the specific row you want to use
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return editPickerData[row]
    }
    
    @IBAction func submitButtonTapped(_ sender: UIButton) {
        //this checks to make sure there is data in the text fields
        guard let title = editGameNameTextField.text,
            title.trimmingCharacters(in: .whitespacesAndNewlines) != "",
            let gameDescription = editGameDescriptionTextField.text,
            gameDescription.trimmingCharacters(in: .whitespacesAndNewlines) != "" else {
                //show an error and return
                errors()
                return
        }
        
        //The rating for the edited game
        let editedRating = editGameRatingSegmentedController.selectedSegmentIndex
        
        switch editedRating {
        case 0:
            gameToEdit.rating = "E"
        case 1:
            gameToEdit.rating = "E10+"
        case 2:
            gameToEdit.rating = "T"
        case 3:
            gameToEdit.rating = "M"
        case 4:
            gameToEdit.rating = "AO"
        default:
            gameToEdit.rating = "E"
        }
        
        let realm = try! Realm()
        
        try! realm.write {
        gameToEdit.title = title
        gameToEdit.gameDescription = gameDescription
        gameToEdit.genre = editPickerData[editGameGenrePicker.selectedRow(inComponent: 0)]
        }
        
        edited()
    }
    
    
    
    //This function is a error alert so when editing a game if all of the information isn't there, then there will be a error message
    func errors() {
        //UIAlert controller
        let errorAlert = UIAlertController(title: "Error", message: "All Fields not filled out. Please fill out all of the fields to edit this game.", preferredStyle: .alert)
        
        //UIAlertAction
        let closeAction = UIAlertAction(title: "Close", style: .default, handler: nil)
        
        //add the action in the alert controller
        errorAlert.addAction(closeAction)
        
        //present alert controller
        self.present(errorAlert, animated: true, completion: nil)
    }
    
    
    //when submit button tapped it will take you back to the main screen.
    func edited() {
        //UIAlertController
        let editedAlert = UIAlertController(title: "Edited Game", message: "You edited \(gameToEdit.title)", preferredStyle: .alert)
        
        //UIAlertAction
        let closeAction2 = UIAlertAction(title: "Close", style: .default) { _ in
            //segue to other screen
            self.performSegue(withIdentifier: "edited", sender: self)
        }
        
        //add action in the alert controller
        editedAlert.addAction(closeAction2)
        
        //present alert controller
        self.present(editedAlert, animated: true, completion: nil)
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



