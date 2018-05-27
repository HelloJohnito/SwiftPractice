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
    
    var time = 210
    
    @IBOutlet weak var displayTime: UILabel!
    
    
    @IBAction func pausePressed(_ sender: Any) {
        timer.invalidate()
    }
    
    @IBAction func playPressed(_ sender: Any) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(processTimer), userInfo: nil, repeats: true)
    }
    
    @IBAction func subtractTenMin(_ sender: Any) {
//        let time = Int(displayTime.text!)!
        
        if time > 10 {
            time -= 10
            displayTime.text = String(time)
        }
        
    }
    
    @IBAction func addTenMin(_ sender: Any) {
        time += 10
        displayTime.text = String(time)
    }
    
    @IBAction func resetPressed(_ sender: Any) {
        self.pausePressed("")
        time = 210
        displayTime.text = String(time)
        self.playPressed("")
    }
    
    
    func processTimer() {
        
        if time == 0 {
            timer.invalidate()
        }
        else{
            time-=1
            displayTime.text = String(time)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(processTimer), userInfo: nil, repeats: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

