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
    @IBOutlet weak var istagramCollectionView: UICollectionView!
    //Data Object
    var userDataObject = [UserInfo]()
    lazy var userFbObject = [UserFB]()

    override func viewDidLoad() {
        super.viewDidLoad()
        getUserData()
        fetchInformation()
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
       
    }
    func fetchInformation () {
        DispatchQueue.global(qos: .userInitiated).async {
            let worker = HttpWorker()
            worker.fetchUserInformationFromRemoteServer { [weak self] (object) in
                if object != nil {
                    self?.userFbObject = object!
                    self?.dataSourceAndDelegation(with: true) // we have objects so lets init tableView and CollectionView
                } else {
                    self?.dataSourceAndDelegation(with: false) // we do not have any object so lets deAlloc Table and Collection
                }
            }
        }
    }

    private func dataSourceAndDelegation (with status: Bool) {
        DispatchQueue.main.async { [weak self] in
            if status {
                self?.istagramTableView.delegate = self
                self?.istagramTableView.dataSource = self
                self?.istagramCollectionView.delegate = self as! UICollectionViewDelegate
                self?.istagramCollectionView.dataSource = self as! UICollectionViewDataSource
            } else {
                self?.istagramTableView.delegate = self
                self?.istagramTableView.dataSource = self
                self?.istagramCollectionView.delegate = nil
                self?.istagramCollectionView.dataSource = nil
            }
            self?.istagramCollectionView.reloadData()
            self?.istagramTableView.reloadData()
                }
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

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.userFbObject.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"xxxNewsFeedCollCell", for: indexPath) as? IstagramCollectionViewCell else {
            fatalError("Could not dequeue cell with identifier xxxNewsFeedCollCell")
        }
        
        let object = self.userFbObject[indexPath.item]
        
        // assign avatar
        let url = URL(string: object.avatar!) // cast string to url
        cell.fbAvatar.sd_setImage(with: url)
        cell.fbUserName.text = object.fbName
        return cell
    }
}

