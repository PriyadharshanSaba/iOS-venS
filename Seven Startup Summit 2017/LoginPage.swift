//
//  LoginPage.swift
//  Seven Startup Summit 2017
//
//  Created by Priyadharshan Saba on 23/01/18.
//  Copyright © 2018 Priyadharshan Saba. All rights reserved.
//

import UIKit
import Foundation

class LoginPage: UIViewController {

    

    @IBOutlet weak var login: UILabel!

    @IBOutlet weak var userid: UITextField!
    var userName: String {
        get {
             return userid.text ?? ""
        }
        set {
            userid.text = newValue
        }
    }

    @IBOutlet weak var password: UITextField!
    var userPASS: String {
        get {
            return password.text ?? ""
        }
        set {
            password.text = newValue
        }
    }

    @IBOutlet weak var login_button: UIButton!

    @IBAction func log_btn(_ sender: Any) {

        if userName.count > 1 || userPASS.count > 1 {

            //mySQL-API-connection
            let furl = URL(string: "http://phpmysqlapi.herokuapp.com?userid="+self.userName )
            let task = URLSession.shared.dataTask(with: furl!) { (data, response, error) in
                if error != nil {
                    print("Error")
                }
                else {
                    if let mydata = data {
                        do {
                            let myJson = try JSONSerialization.jsonObject(with: mydata, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject

                            let fetchedPSW = myJson["fetched"] as? String ?? ""

                            if fetchedPSW == self.userPASS {
                                print("\n\nSuccess")
                            }
                            else {
                                print("\n\nFail")
                            }
                        }
                        catch {
                            // catch error
                        }
                    }
                }
            }
            task.resume()
        }
        else {
            print("\n\nPlease Input")
        }
    }



    override func viewDidLoad() {
        super.viewDidLoad()

        //backgroundImage
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "win.jpg")
        backgroundImage.contentMode = UIViewContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)

    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let user_name = "PD"
        if let destinationViewController = segue.destination as? home {
            destinationViewController.data = user_name
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
