//
//  ViewController.swift
//  AnimationDemo
//
//  Created by John  Ito lee on 11/4/17.
//  Copyright © 2017 Johnito. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    var number = 1
    var isAnimating = false
    var timer = Timer()
    
    @IBAction func nextImage(_ sender: UIButton) {
        if number == 3 {
            number = 0
        }
        number += 1
        image.image = UIImage(named: "image-\(number).jpeg")
    }
    
    
    @IBAction func fadeIn(_ sender: Any) {
        image.alpha = 0
        UIView.animate(withDuration: 1, animations: {
            self.image.alpha = 1
        
        })
    }
    
    
    @IBAction func slideIn(_ sender: Any) {
        image.center = CGPoint(x: image.center.x - 500, y: image.center.y)
        
        UIView.animate(withDuration: 0.5, animations: {
            self.image.center = CGPoint(x: self.image.center.x + 500, y: self.image.center.y)
        })
        
    }
    
    
    @IBAction func grow(_ sender: Any) {
        image.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        UIView.animate(withDuration: 1, animations: {
            self.image.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        })
    }
    
    
    func animate() {
        if number == 3 {
            number = 0
        }
    
        number += 1
        image.image = UIImage(named: "image-\(number).jpeg")
    }
    
    
    @IBAction func automateImage(_ sender: UIButton) {
        var title = ""
        
        if isAnimating {
            timer.invalidate()
            title = "Play"
        } else {
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.animate), userInfo: nil, repeats: true)
            title = "Stop"
        }
        
        isAnimating = !isAnimating
        sender.setTitle(title, for: [])
        // you can also have a button outlet
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



