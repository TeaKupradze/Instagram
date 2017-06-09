//
//  CameraVC.swift
//  Instagram
//
//  Created by Tea Kupradze on 6/9/17.
//  Copyright © 2017 Lemondo. All rights reserved.
//

import UIKit

class CameraVC: UIViewController , UIImagePickerControllerDelegate , UINavigationControllerDelegate {

    var imagePicker = UIImagePickerController()
    //@IBOutlet
    @IBOutlet weak var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      

    }
    //Choose Photo and Shou Image View
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        imageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        imagePicker.dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        imagePicker.dismiss(animated: true, completion: nil)
    }
    //Open Photo Library
    @IBAction func OpenPhotoLibrary(_ sender: Any) {
        imagePicker =  UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        
        present(imagePicker, animated: true, completion: nil)
    
    }
    
    // Open Camera
    @IBAction func OpenCamera(_ sender: Any) {
        imagePicker =  UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .camera
        
        present(imagePicker, animated: true, completion: nil)
    
  }
    //Save Image Gallary
    @IBAction func SaveBtn(_ sender: Any) {
        
    }
    
}
