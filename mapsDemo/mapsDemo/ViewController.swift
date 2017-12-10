//
//  ViewController.swift
//  mapsDemo
//
//  Created by John  Ito lee on 12/9/17.
//  Copyright © 2017 Johnito. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var map: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // setting the map view to a location
        let latitude: CLLocationDegrees = 37.7749
        let longitude: CLLocationDegrees = -122.4194
        
        let latDelta: CLLocationDegrees = 0.05
        let longDelta: CLLocationDegrees = 0.05
        
        let span: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: longDelta)
        
        let coordinate: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        
        let region: MKCoordinateRegion = MKCoordinateRegion(center: coordinate, span: span)
        
        map.setRegion(region, animated: true)
        
        // setting down an annotation
        let annotation = MKPointAnnotation()
        annotation.title = "San Francisco"
        annotation.subtitle = "I Will go here one day."
        annotation.coordinate = coordinate
        map.addAnnotation(annotation)
        
        // setting a long press gesture
        let uiLongPress = UILongPressGestureRecognizer(target: self, action: #selector(ViewController.longpress(gestureRecognizer:)))
        uiLongPress.minimumPressDuration = 2
        map.addGestureRecognizer(uiLongPress)
    }
    
    func longpress(gestureRecognizer: UIGestureRecognizer){
        let touchPoint = gestureRecognizer.location(in: self.map)
        print(touchPoint)
        let coordinate = map.convert(touchPoint, toCoordinateFrom: self.map)
        print(coordinate)
        
        let annotation = MKPointAnnotation()
        annotation.title = "New Place"
        annotation.subtitle = "I Will go here one day."
        annotation.coordinate = coordinate
        map.addAnnotation(annotation)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

