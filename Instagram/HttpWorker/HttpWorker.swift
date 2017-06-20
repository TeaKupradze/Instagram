//
//  HttpWorker.swift
//  Instagram
//
//  Created by Tea Kupradze on 6/19/17.
//  Copyright © 2017 Lemondo. All rights reserved.
//

import UIKit
import Alamofire

class HttpWorker {
    
    // MARK: - Data Load
    // This function will download information and fetch downloaded data from remote server
    // Using provided url which is placed in constants
    func fetchUserInformationFromRemoteServer (completionBlock: @escaping ([UserFB]?) -> ()) {
        Alamofire.request(Constants.Http.getUrl).responseJSON { response in // GET Request
            DispatchQueue.global(qos: .userInitiated).async {
                if let JSON = response.result.value { // response from alamofire
                    if let data = JSON as? [Dictionary<String, String>] { // trying to cast ANY object to Array Of Dictionaries
                        
                        if data.count > 0 { // check if casted result is not empty
                            var userArray = [UserFB]() // create array of local userObject
                            for item in data {
                                var user = UserFB() // create local userObject
                                
                                user.avatar = item["img"]
                                user.fbName = item["fbname"]
                                
                                userArray.append(user) // created user should be appended to the array of users
                            }
                            
                            // array is full and we should complete with object
                            completionBlock(userArray)
                        } else {
                            completionBlock(nil) // if results are empty we do not have any users so lets complete with nil
                        }
                    }
                } // JSON check End
            } // dispatch end
        }
    }
    
}
