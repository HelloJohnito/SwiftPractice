//
//  ViewController.swift
//  Advanced Segues
//
//  Created by John  Ito lee on 12/26/17.
//  Copyright © 2017 Johnito. All rights reserved.
//

import UIKit


// two ways to send information from page to page.
//  one create a global variable.
//  two pass the variable through.

// In the main story board, select the segue
// attibute inspector (right hand, down arrow), name the identifier (toSecondView)

// if there is no button to go to the next page. Use
// self.performSegue(withIdentifier: "identifierName", sender: self)


let globalVariable = "John"


// Table Set up 
// Add table view 
    // add 1 prototype cell
        // name the identifier ("cell")
    // Create Segue from the cell to page two. (optional)
        // you can create it and name the identifier different from the buttons segue. Then in prepare function you can check the identifier and send information


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var activeRow = 0 // sending this information when we touch the row
    
    // These are from DataSource. CMD Click, first two functions
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4 // 4 rows table
    }
    
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = "Row \(indexPath.row)"
        return cell
    }
    
    
    // from ui tableview delegate: This is called when table row is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        activeRow = indexPath.row
        self.performSegue(withIdentifier: "fromCellToView2", sender: nil)
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSecondView" {
            let secondViewController = segue.destination as! SecondViewController
            
            secondViewController.username = "from button not sending row"
        }
        
        if segue.identifier == "fromCellToView2" {
            let secondViewController = segue.destination as! SecondViewController
            secondViewController.username = "From Cell, sending row"
            secondViewController.activeRow = activeRow
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

