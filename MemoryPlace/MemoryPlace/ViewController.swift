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
        
        // add long press
        let uiLongPress = UILongPressGestureRecognizer(target: self, action: #selector(ViewController.longpress(gestureRecognizer:)))
        uiLongPress.minimumPressDuration = 2
        map.addGestureRecognizer(uiLongPress)
        
        // Display map with details 
        if activePlace == -1 {
            // when user presses the add button
            
            
        } else {
            // when user presses an item
            
            if places.count > activePlace {
                if let name = places[activePlace]["name"] {
                    if let lat = places[activePlace]["lat"] {
                        if let long = places[activePlace]["long"] {
                            if let latitude = Double(lat) {
                                if let longitude = Double(long){
                                    
                                    // set map setting
                                    let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
                                    let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
                                    let region = MKCoordinateRegion(center: coordinate, span: span)
                                    self.map.setRegion(region, animated: true)
                                    
                                    //set up annotation
                                    let annotation = MKPointAnnotation()
                                    annotation.coordinate = coordinate
                                    annotation.title = name
                                    self.map.addAnnotation(annotation)
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
    
    func longpress(gestureRecognizer: UIGestureRecognizer){
        if (gestureRecognizer.state == UIGestureRecognizerState.began) {
            print("Long press Began");
            
            // get touch points
            let touchPoint = gestureRecognizer.location(in: self.map)
            let newCoordinate = self.map.convert(touchPoint, toCoordinateFrom: self.map)
            
            // Place new touch point on map with title and save it into places array
            let location = CLLocation(latitude: newCoordinate.latitude, longitude: newCoordinate.longitude)
            
            var title = ""
            
            CLGeocoder().reverseGeocodeLocation(location, completionHandler: { (placemarks, error) in
                if error != nil {
                    print(error)
                }
                else {
                    if let placemark = placemarks?[0] {
                        if placemark.subThoroughfare != nil {
                            title += placemark.subThoroughfare! + " "
                        }
                        if placemark.thoroughfare != nil {
                            title += placemark.thoroughfare!
                        }
                    }
                }
                
                if title == "" {
                    title = "Add \(NSDate())"
                }
                
                // create an annotation
                let annotation = MKPointAnnotation()
                annotation.coordinate = newCoordinate
                annotation.title = title
                self.map.addAnnotation(annotation)
                
                // add to places array
                places.append(["name": title, "lat": String(newCoordinate.latitude), "long": String(newCoordinate.longitude)])
                
                print(places)
            
            })
            
        } else if (gestureRecognizer.state == UIGestureRecognizerState.ended) {
            print("Long press Ended.");
        }
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

