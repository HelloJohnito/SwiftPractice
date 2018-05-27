//
//  SecondViewController.swift
//  TodoDemo
//
//  Created by John  Ito lee on 10/30/17.
//  Copyright © 2017 Johnito. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var userInput: UITextField!
    
    
    @IBAction func saveItem(_ sender: UIButton) {
        let itemObject = UserDefaults.standard.object(forKey: "items")
        
        var items: [String]
        
        if let tempItems = itemObject as? [String] {
            
            items = tempItems
            items.append(userInput.text!)
        } else {
            items = [userInput.text!]
        }
        
        UserDefaults.standard.set(items, forKey: "items")
        userInput.text = ""
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // runs when user touches the view board
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true) // close keyboard when user touches outside the keyboard.
    }
    
    // return button on keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    

}
