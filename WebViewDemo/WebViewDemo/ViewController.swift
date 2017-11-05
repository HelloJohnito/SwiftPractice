//
//  ViewController.swift
//  WebViewDemo
//
//  Created by John  Ito lee on 11/3/17.
//  Copyright © 2017 Johnito. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var webView: UIWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
      
        /*
        let url = URL(string:"https://www.google.com")!
        webView.loadRequest(URLRequest(url: url)) 
        webView.loadHTMLString("<h1>Hello</h>", baseURL: nil)
        */
        
        if let url = URL(string:"https://stackoverflow.com") {
            let request = NSMutableURLRequest(url: url)
            let task = URLSession.shared.dataTask(with: request as URLRequest) {
                data, response, error in
                
                if error != nil {
                    print(error)
                }
                else {
                    if let unwrappedData = data {
                        let dataString = NSString(data: unwrappedData, encoding: String.Encoding.utf8.rawValue)
                        print(dataString)
                        
                        DispatchQueue.main.sync(execute: {
                            //update ui
                        })
                    }
                }
            }
            
            task.resume()
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

