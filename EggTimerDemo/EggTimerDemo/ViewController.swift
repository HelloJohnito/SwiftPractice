//
//  ViewController.swift
//  EggTimerDemo
//
//  Created by John  Ito lee on 10/1/17.
//  Copyright © 2017 Johnito. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var timer = Timer()
    
    @IBOutlet weak var displayTime: UILabel!
    
    
    @IBAction func pausePressed(_ sender: Any) {
        timer.invalidate()
    }
    
    @IBAction func playPressed(_ sender: Any) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(processTimer), userInfo: nil, repeats: true)
    }
    
    @IBAction func subtractTenMin(_ sender: Any) {
        let time = Int(displayTime.text!)!
        
        if time > 10 {
            displayTime.text = String(time - 10)
        }
        else {
            displayTime.text = "0"
        }
        
    }
    
    @IBAction func addTenMin(_ sender: Any) {
        let time = Int(displayTime.text!)!
        displayTime.text = String(time + 10)
    }
    
    @IBAction func resetPressed(_ sender: Any) {
        self.pausePressed("")
        displayTime.text = "210"
        self.playPressed("")
    }
    
    
    func processTimer() {
        let time = Int(displayTime.text!)!
        
        if time == 0 {
            timer.invalidate()
        }
        else{
            displayTime.text = String(time - 1)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(processTimer), userInfo: nil, repeats: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

