//
//  ViewController.swift
//  GuessingGame
//
//  Created by John  Ito lee on 10/1/17.
//  Copyright © 2017 Johnito. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userInput: UITextField!
    @IBOutlet weak var resultText: UITextField!
    
    @IBAction func submitButton(_ sender: UIButton) {
        let randomNum = String(arc4random_uniform(3))
        
        if let userEnteredString = userInput.text {
            
            if userEnteredString == randomNum {
                resultText.text = "You are correct!"
            } else {
                resultText.text = "Incorrect! The answer was " + randomNum + "."
            }
        }
        
    }
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

