//
//  ViewController.swift
//  Seven Startup Summit 2017
//
//  Created by Priyadharshan Saba on 23/01/18.
//  Copyright © 2018 Priyadharshan Saba. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //backgroundImage
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "win.jpg")   //SET YOUR BACKGROUND IMAGE HERE, FROM ASSETS
        backgroundImage.contentMode = UIViewContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)

        //mySQL-API-connection
        let url = URL(string: " <url> ")    //API URL
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error != nil {
                print("Error")
            }
            else {
                if let mydata = data {
                    do {
                        let myJson = try JSONSerialization.jsonObject(with: mydata, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject

                        print(myJson[" <field> "]! ?? "noData")
                    }
                    catch {
                        // catch error
                    }
                }
            }
        }
        task.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
