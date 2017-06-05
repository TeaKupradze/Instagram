//
//  RegistrationVC.swift
//  Instagram
//
//  Created by Tea Kupradze on 6/3/17.
//  Copyright © 2017 Lemondo. All rights reserved.
//

import UIKit

class RegistrationVC: UIViewController {
    
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var fullName: UITextField!
    @IBOutlet weak var mail: UITextField!
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var resultLbl: UILabel!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        userName.text = loadName()
        password.text = loadPassword()
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
 
    @IBAction func userRegister(_ sender: Any) {
        
        if ((userName.text?.characters.count)! > 0 && (password.text?.characters.count)! > 0){
            saveData(userName: userName.text!, password: password.text!)
            name.text = " "
            fullName.text = " "
            mail.text = " "
            userName.text = " "
            password.text = " "
            resultLbl.text = "რეგისტრაცია წარმატებით დასრულდა"
            dismiss(animated: true, completion: nil)
        }
        else {
            resultLbl.text = "ვერ დარეგისტრირდა"
        }
    }

    }
extension RegistrationVC : UITextFieldDelegate {
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
    
}
