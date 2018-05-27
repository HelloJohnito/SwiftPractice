//
//  ViewController.swift
//  WeatherApp
//
//  Created by John  Ito lee on 11/4/17.
//  Copyright © 2017 Johnito. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cityTextField: UITextField!
    
    @IBOutlet weak var weatherOutPut: UILabel!
    
    
    @IBAction func submitCity(_ sender: UIButton) {
        
        if let url = URL(string: "https://www.weather-forecast.com/locations/" + cityTextField.text!.replacingOccurrences(of: " ", with: "-") + "/forecasts/latest") {
            
            let request = NSMutableURLRequest(url: url)
        
        
            let task = URLSession.shared.dataTask(with: request as URLRequest){
                data, response, error in
            
                var message = ""
            
                if error != nil {
                    print(error)
                }
                else {
                    if let unWrappedData = data {
                        let dataString = NSString(data: unWrappedData, encoding: String.Encoding.utf8.rawValue)
                        var stringSeparator = "Weather Forecast Summary:</b><span class=\"read-more-small\"><span class=\"read-more-content\"> <span class=\"phrase\">"
                    
                        if let contentArray = dataString?.components(separatedBy: stringSeparator) {
                            if contentArray.count > 1 {
                                stringSeparator = "</span>"
                                let newContentArray = contentArray[1].components(separatedBy: stringSeparator)
                            
                                if newContentArray.count > 1 {
                                    message = newContentArray[0].replacingOccurrences(of: "&deg;", with: "°")
                                    print(message)
                                }
                            }
                        }
                    }
                }
            
                if message == "" {
                    message = "The weather there could not be found. Try again."
                }
            
                DispatchQueue.main.sync(execute: {
                    self.weatherOutPut.text = message
                })
            
            }
            
            task.resume()
        }
        else {
            weatherOutPut.text = "The weather there could not be found. Try again."
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

