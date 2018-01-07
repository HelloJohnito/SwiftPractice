//
//  ViewController.swift
//  MemoryPlace
//
//  Created by John  Ito lee on 1/7/18.
//  Copyright © 2018 Johnito. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var map: MKMapView!
        // set up the delegates
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(activePlace)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

