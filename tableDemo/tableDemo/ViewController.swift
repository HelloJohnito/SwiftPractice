//
//  ViewController.swift
//  tableDemo
//
//  Created by John  Ito lee on 10/24/17.
//  Copyright © 2017 Johnito. All rights reserved.
//

import UIKit

// Important on main story, control click the table to the yellow dot and add in datasource and delegate. This creates the outlets. They are inherited in this class. 
// prototype to 1
// select the cell and add an identifier name

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    var friends = ["John", "Aaron", "Tyler"]
    
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
    
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        
        // indexPath is 0 to friends.count b/c the returned value from tableView listed above. 
        cell.textLabel?.text = friends[indexPath.row]
        return cell
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

