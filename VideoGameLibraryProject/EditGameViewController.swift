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
    

    @IBOutlet weak var editGameNameTextField: UITextField!
    @IBOutlet weak var editGameDescriptionTextField: UITextView!
    @IBOutlet weak var editGameRatingSegmentedController: UISegmentedControl!
    @IBOutlet weak var editGameGenrePicker: UIPickerView!
    
    let editPickerData: [String] = ["Massive Multiplayer Online (MMO)", "Simulations", "Adventure", "Real-Time Strategy (RTS)", "Puzzle", "Action", "Stealth Shooter", "First-Person Shooter (FPS)", "Combat", "Sports", "Role-Playing (RPG)", "Educational", "Battle Royale", "Survival Horror", "Hybrid", "Dance/Rhythm", "Platform", "Shooter"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //get the genre for the game
        switch gameToEdit.genre {
        case "Action":
            editGameGenrePicker.selectRow(5, inComponent: 0, animated: false)
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
