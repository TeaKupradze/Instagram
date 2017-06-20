//
//  SettingsVC.swift
//  Instagram
//
//  Created by Tea Kupradze on 6/15/17.
//  Copyright © 2017 Lemondo. All rights reserved.
//

import UIKit

class SettingsVC: UIViewController {

    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var lblUserEmail: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    avatar.contentMode = .scaleAspectFill
    avatar.clipsToBounds = true
        
    avatar.layer.cornerRadius = avatar.frame.size.width/2
    avatar.layer.masksToBounds = true
        
    avatar.layer.borderWidth = 2
    avatar.layer.borderColor = UIColor.gray.cgColor

    }
    
//    // Construct User Object
//     func generateUserObjectUsingGraphResponse (with result: Any) {
//        var object = UserFB()
//        if let rep = result as? [String: Any] {
//            object.email = rep["email"] as? String
//            object.name = rep["name"] as! String
//            object.avatar = self.getUserAvatarUrl(with: rep["picture"] as! [String: Any])
//            self.userInterfaceConfiguration(with: object)
//        }
//    }
//    
//     func userInterfaceConfiguration (with object: UserFB) {
//        lblUserName.text = object.name
//        lblUserEmail.text = object.email
//        avatar.sd_setImage(with: object.avatar)
//    }
//    
//     func getUserAvatarUrl (with value: [String: Any]) -> URL? {
//        if let value1 = value["data"] as? [String: Any] {
//            if let value2 = value1["url"] as? String {
//                return URL(string: value2)
//            }
//        }
//        return nil
//    }
}



