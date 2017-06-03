//
//  LogInVC.swift
//  Instagram
//
//  Created by Tea Kupradze on 6/2/17.
//  Copyright © 2017 Lemondo. All rights reserved.
//

import UIKit

class LogInVC: UIViewController {
    
    //IBOutlet
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    //IBAction LogIn Button
    @IBAction func LogInBtn(_ sender: Any) {
        
    }

    @IBAction func backBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
