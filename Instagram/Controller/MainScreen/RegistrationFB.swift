//
//  RegistrationFB.swift
//  Instagram
//
//  Created by Tea Kupradze on 6/10/17.
//  Copyright © 2017 Lemondo. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import SDWebImage


class RegistrationFB: UIViewController {
    //IBOutlet
    @IBOutlet weak var logInBtn: FBSDKLoginButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logInBtn.readPermissions = ["public_profile", "email", "user_friends", "user_photos"]
        getUserInformation()
    }
    //status bar change color
    override var  preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    //User Status
    fileprivate func UserIsLoggIned() -> Bool{
        return FBSDKAccessToken.current() != nil
    }
    //Dowload User Unformation
    fileprivate func getUserInformation () {
        if UserIsLoggIned() {
            let params = ["fields":"id,name,picture.type(large),email"]
            FBSDKGraphRequest(graphPath: "me", parameters: params).start(completionHandler: { [weak self] (connection, result, error) -> Void in
                if error == nil && result != nil {
                }
            })
        } else {
            print("Not Logged In!")
        }
    }
}
extension RegistrationFB : FBSDKLoginButtonDelegate {
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        let nextController = self.storyboard?.instantiateViewController(withIdentifier: "TabBarIdentity") as! TabBarController
        if error == nil {
            getUserInformation()
            self.navigationController?.pushViewController(nextController, animated: true)
        } else {
            print(error.localizedDescription)
        }
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print("User Logged Out!")
    }

}

