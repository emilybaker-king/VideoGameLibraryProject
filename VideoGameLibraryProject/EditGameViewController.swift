//
//  EditGameViewController.swift
//  VideoGameLibraryProject
//
//  Created by Emily Baker-King on 10/18/18.
//  Copyright © 2018 Emily Baker-King. All rights reserved.
//

import UIKit

class EditGameViewController: UIViewController {
    
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
        
        
        //select the rating of the game selected to edit
        var ratingEdit: String!
        
        switch gameToEdit.rating {
        case "E":
            editGameRatingSegmentedController.selectedSegmentIndex
        default:
            
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
            editGameGenrePicker.selectedRow(inComponent: 0)
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
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
