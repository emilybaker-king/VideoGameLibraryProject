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
    
    var pickerData: [String] = ["Massive Multiplayer Online (MMO)", "Simulations", "Adventure", "Real-Time Strategy (RTS)", "Puzzle", "Action", "Stealth Shooter", "First-Person Shooter (FPS)", "Combat", "Sports", "Role-Playing (RPG)", "Educational", "Battle Royale", "Survival Horror", "Hybrid", "Dance/Rhythm", "Platform", "Shooter"]
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    
    @IBAction func submitButtonTapped(_ sender: Any) {
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
