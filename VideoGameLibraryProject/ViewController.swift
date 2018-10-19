//
//  ViewController.swift
//  VideoGameLibraryProject
//
//  Created by Emily Baker-King on 10/15/18.
//  Copyright © 2018 Emily Baker-King. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    
 

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        ageTextField.addTarget(self, action: #selector(ViewController.textFieldDidChange), for: UIControl.Event.editingChanged)
        submitButton.isHidden = true
    }

    @objc func textFieldDidChange() {
        if ageTextField.text?.count == 0 {
            submitButton.isHidden = true
        } else {
            submitButton.isHidden = false
        }
    }
    

    @IBAction func submitButtonClicked(_ sender: Any) {
        
        guard Int(ageTextField.text!) != nil else {
            error()
        return
        }
        
        self.performSegue(withIdentifier: "showMainScreen", sender: self)
        
    }
    
    
    
    func error() {
        //UIAlert controller
        let errorAlert = UIAlertController(title: "Error", message: "Number not entered. Please enter only numbers in this field", preferredStyle: .alert)
        
        //UIAlertAction
        let closeAction = UIAlertAction(title: "Close", style: .default, handler: nil)
        
        //add the action in the alert controller
        errorAlert.addAction(closeAction)
        
        //present alert controller
        self.present(errorAlert, animated: true, completion: nil)
    }

    
}


