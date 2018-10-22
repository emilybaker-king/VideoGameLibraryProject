//
//  ViewController.swift
//  VideoGameLibraryProject
//
//  Created by Emily Baker-King on 10/15/18.
//  Copyright © 2018 Emily Baker-King. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
   
    @IBOutlet weak var submitButton: UIButton!
    
 

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

 
    

    @IBAction func submitButtonClicked(_ sender: Any) {
        
        self.performSegue(withIdentifier: "showMainScreen", sender: self)
        
    }
    

    
}


