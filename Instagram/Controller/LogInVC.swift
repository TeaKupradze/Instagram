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
        username.text = loadName()
        password.text = loadPassword()
        password.text = " "
        username.text = " "

        // Do any additional setup after loading the view.
    }
    
    func saveData (userName : String , password : String){
        let defaults = UserDefaults.standard
        defaults.set(userName, forKey: "rrrUserName")
        defaults.set(password, forKey: "rrrPassword")
        
    }
    
    func  loadName() -> String {
        let defaults = UserDefaults.standard
        if let currentName =  defaults.value(forKey: "rrrUserName"){
            return (currentName as? String)!
            
        }
        else {
            return " "
        }
    }
    
    func loadPassword () -> String{
        let defaults = UserDefaults.standard
        if let currrentPassword = defaults.value(forKey: "rrrPassword"){
            return (currrentPassword as? String)!
        }
        else {
            return " "
        }
    }
  
    @IBAction func logInBtn(_ sender: Any) {
    
        if username.text == loadName() && password.text == loadPassword() {
            
        let nextController = self.storyboard?.instantiateViewController(withIdentifier: "TabBarIdentity") as! TabBarController
            self.navigationController?.pushViewController(nextController, animated: true)
            username.text = " "
            password.text = " "
        }
        else {
            print("ar sheiqmna contoleri")
            }

    }
    
    @IBAction func registrationBtn(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "RegistrationIdentity") as!RegistrationVC
        self.navigationController?.pushViewController(vc, animated:true)
        
    }
    
    }
extension  LogInVC : UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == self.username {
            self.password.becomeFirstResponder()
        }
        if textField == self.password{
            self.password.resignFirstResponder()
        }
        return true
        
    }
    
}

