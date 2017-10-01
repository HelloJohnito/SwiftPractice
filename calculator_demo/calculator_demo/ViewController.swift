//
//  ViewController.swift
//  calculator_demo
//
//  Created by John  Ito lee on 9/16/17.
//  Copyright © 2017 Johnito. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var display: UILabel!
    var model = CalculatorModel()
    
    private var userIsTyping = false
    
    @IBAction private func appendDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        
        if userIsTyping {
            display.text = display.text! + digit
        } else {
            display.text = digit
            userIsTyping = true
        }
    }
    
    @IBAction private func performOperation(_ sender: UIButton) {
        if userIsTyping {
            model.setOperand(operand: displayValue)
            userIsTyping = false
        }
        
        if let mathemathicalSymbol = sender.currentTitle {
            model.performOperation(symbol: mathemathicalSymbol)
        }
        
        displayValue = model.result
    }
    
    private var displayValue: Double {
        get{
            return Double(display.text!)!
        }
        set{
            display.text = String(newValue)
            userIsTyping = false
        }
    }
    
}


