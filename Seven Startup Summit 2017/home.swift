//
//  home.swift
//  Seven Startup Summit 2017
//
//  Created by Priyadharshan Saba on 30/01/18.
//  Copyright © 2018 Priyadharshan Saba. All rights reserved.
//

import Foundation
import UIKit

class home: UIViewController {

    var data = String()

    @IBOutlet weak var user_name_container: UILabel!


    override func viewDidLoad() {
        super.viewDidLoad()
        let user_name = data.uppercased()
        user_name_container.text=user_name
        print ("\n"+data)

    }

}
