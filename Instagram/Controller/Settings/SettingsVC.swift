//
//  SettingsVC.swift
//  Instagram
//
//  Created by Tea Kupradze on 6/15/17.
//  Copyright © 2017 Lemondo. All rights reserved.
//

import UIKit
import SDWebImage
import FBSDKCoreKit
import FBSDKLoginKit




class SettingsVC: UIViewController {

    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var lblUserEmail: UILabel!
    var settingsObj = [UserFB]()
    
    override func viewDidLoad() {
    super.viewDidLoad()
       getUserInformation()
       //add top bar
      let topBar = Bundle.main.loadNibNamed("TopBarView", owner: self, options: nil)? [0] as! TopBarView
      self.view.addSubview(topBar)
      
    avatar.contentMode = .scaleAspectFill
    avatar.clipsToBounds = true
        
    avatar.layer.cornerRadius = avatar.frame.size.width/2
    avatar.layer.masksToBounds = true
        
    avatar.layer.borderWidth = 2
    avatar.layer.borderColor = UIColor.purple.cgColor

    }
  
    fileprivate func UserIsLoggIned() -> Bool{
        return FBSDKAccessToken.current() != nil
    }
    
     func getUserInformation () {
        if UserIsLoggIned() {
            let params = ["fields":"id,name,picture.type(large),email"]
            FBSDKGraphRequest(graphPath: "me", parameters: params).start(completionHandler: { [weak self] (connection, result, error) -> Void in
                if error == nil && result != nil {
                    self?.generateUserObjectUsingGraphResponse(with: result!)
                }
            })
        } else {
            print("Not Logged In!")
        }
    }
    
    // Construct User Object
     func generateUserObjectUsingGraphResponse (with result: Any) {
        var object = UserFB()
        if let rep = result as? [String: Any] {
            object.email = rep["email"] as? String
            object.fbName = rep["name"] as! String
            object.avatar1 = self.getUserAvatarUrl(with: rep["picture"] as! [String: Any])
            self.userInterfaceConfiguration(with: object)
        }
    }
    
     func userInterfaceConfiguration (with settingsObj: UserFB) {
        lblUserName.text = settingsObj.fbName
        lblUserEmail.text = settingsObj.email
       avatar.sd_setImage(with: settingsObj.avatar1)
    }

     func getUserAvatarUrl (with value: [String: Any]) -> URL? {
        if let value1 = value["data"] as? [String: Any] {
            if let value2 = value1["url"] as? String {
                return URL(string: value2)
            }
        }
        return nil
    }
}



