//
//  ViewController.swift
//  WhatIsMyNumber
//
//  Created by John  Ito lee on 10/28/17.
//  Copyright © 2017 Johnito. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var numberDisplayed: UILabel!
    
    
    @IBAction func numberClicked(_ sender: UIButton) {
        let pressedNum = sender.currentTitle!
        if numberDisplayed.text!.characters.count <= 7 {
            numberDisplayed.text! += pressedNum
        }
    }
    
    
    @IBAction func store(_ sender: UIButton) {
        if let saveNumber = numberDisplayed.text {
            // UserDefaults.standard.set(saveNumber, forKey: "phoneNumber")            
            print(saveNumber)
            
        }
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // if the number is saved we just view it to the user. 
        
        // let savedNumber = UserDefaults.standard.object(forKey: "phoneNumber") 
        // if let displaySavedNumber = savedNumber as? String{
        //      numberDisplayed.text = displayedSavedNumber
        // }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

