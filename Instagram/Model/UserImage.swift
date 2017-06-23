//
//  UserImage.swift
//  Instagram
//
//  Created by Tea Kupradze on 6/22/17.
//  Copyright © 2017 Lemondo. All rights reserved.
//

import UIKit

class UserImage: NSObject {
    
    var img : String!

    
    
    init(withDictionary dictionary : Dictionary <String, Any> ) {
        
        self.img = dictionary ["img"] as! String
        
    }
}
