//
//  ViewController.swift
//  Instagram
//
//  Created by Tea Kupradze on 5/31/17.
//  Copyright © 2017 Lemondo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var topBar: UIView!
    @IBOutlet weak var istagramTableView: UITableView!
    
    var userDataObject = [UserInfo]()


    override func viewDidLoad() {
        super.viewDidLoad()
        getUserData()
        // Do any additional setup after loading the view, typically from a nib.
    }

    func getUserData() {
        for  i in 1...8 {
            let object = UserInfo ()
            object.avatarImg = UIImage (named: "AvatarImage_\(i)")
            object.userImg = UIImage (named: "UserImage_\(i)")
            object.name = "TeaKUpradze_\(i)"
            userDataObject.append(object)
    
        }
        
       self.istagramTableView.delegate = self
       self.istagramTableView.dataSource = self
    }


}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userDataObject.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "IstagramIdentity", for: indexPath) as!IstagramTableViewCell
        
       let userObject = userDataObject[indexPath.row]
        
        cell.avatarImg.image = userObject.avatarImg
        cell.userImg.image = userObject.userImg
        cell.nameLbl.text = userObject.name
        
        
        cell.avatarImg.layer.cornerRadius = cell.avatarImg.frame.width / 2
        cell.avatarImg.layer.masksToBounds = true
        
        cell.avatarImg.layer.borderColor = UIColor.white.cgColor
        cell.avatarImg.layer.borderWidth = 2.0
        
        return cell
    }
    
    
    
    
    
    
}
