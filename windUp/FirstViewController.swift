//
//  FirstViewController.swift
//  windUp
//
//  Created by Jesper Sjöberg on 2017-05-17.
//  Copyright © 2017 Jesper Sjöberg. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var compassPin: UIImageView!
    @IBAction func btn(_ sender: Any) {
        compassPin.transform = compassPin.transform.rotated(by: CGFloat(M_PI_4))

        
    }
    
    
    @IBOutlet weak var windLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        
        let urlString = "http://opendata-download-metanalys.smhi.se/api/category/mesan1g/version/1/geotype/point/lon/20/lat/62/data.json"
        let url = URL(string: urlString)
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error != nil{
                print("ERROR task")
            } else{
                
                if let content = data {
                
                    do {
                        let json = try JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                        //print(json)
                        
                        if let timeSeries = json["timeSeries"] as? NSArray {
                            print(timeSeries[0])
                        }
                    }
                    
                    catch{
                        
                    }
                }
            }
            
        }
        task.resume()
        
   
        
        
        
    }//ViewDidLoad

 
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

