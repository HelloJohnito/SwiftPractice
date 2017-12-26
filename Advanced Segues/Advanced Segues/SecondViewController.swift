//
//  SecondViewController.swift
//  Advanced Segues
//
//  Created by John  Ito lee on 12/26/17.
//  Copyright © 2017 Johnito. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    var username = ""
    var activeRow:Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print(username)
        
        if let active = activeRow {
            print(active)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
