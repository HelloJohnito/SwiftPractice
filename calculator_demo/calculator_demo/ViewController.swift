//
//  ViewController.swift
//  calculator_demo
//
//  Created by John  Ito lee on 9/16/17.
//  Copyright © 2017 Johnito. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var display: UILabel!

    var userIsTyping = false
    
    @IBAction func appendDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        
        if userIsTyping {
            display.text = display.text! + digit
        } else {
            display.text = digit
            userIsTyping = true
        }
    }
    
    var operandStack = Array<Double>()
    
    @IBAction func enter() {
        userIsTyping = false
        operandStack.append(displayValue)
        print(operandStack)
    }
    
    var displayValue: Double {
        get{
            print("Enter inside get")
            return NumberFormatter().number(from: display.text!)!.doubleValue
        }
        set{
            display.text = "\(newValue)"
            userIsTyping = false
            print("Enter inside set")
        }
    }
}


