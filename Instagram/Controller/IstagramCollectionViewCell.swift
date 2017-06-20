//
//  IstagramCollectionViewCell.swift
//  Instagram
//
//  Created by Tea Kupradze on 6/19/17.
//  Copyright © 2017 Lemondo. All rights reserved.
//

import UIKit

class IstagramCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var fbAvatar: UIImageView!
    @IBOutlet weak var fbUserName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        fbAvatar.layer.cornerRadius = layer.frame.size.width / 2.0
        fbAvatar.layer.masksToBounds = true
        
        fbAvatar.contentMode = .scaleAspectFill
        fbAvatar.clipsToBounds = true
        
        fbAvatar.layer.borderColor = UIColor.purple.cgColor
        fbAvatar.layer.borderWidth = 0.8
}
    
}
