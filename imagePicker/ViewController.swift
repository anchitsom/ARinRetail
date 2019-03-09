//
//  ViewController.swift
//  imagePicker
//
//  Created by Anchit Som on 9/3/2019.
//  Copyright © 2019 Anchit Som. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func chooseimage(_ sender: Any) {
        
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate=self
        
        let actionSheet = UIAlertController(title:"Photo Source", message: "Choose a source", preferredStyle: .actionSheet);
        
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (action:UIAlertAction) in
            
            if UIImagePickerController.isSourceTypeAvailable(.camera){
                imagePickerController.sourceType = .camera
                self.present(imagePickerController, animated: true, completion: nil)
            }
            else{
            print("Camera not available")
            }
            
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { (action:UIAlertAction) in imagePickerController.sourceType = .photoLibrary
            
            self.present(imagePickerController, animated: true, completion: nil)

        }))

        actionSheet.addAction(UIAlertAction(title: "Camera", style: .cancel, handler: nil))
        
        self.present(actionSheet, animated: true, completion: nil)

    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        imageView.image = image
        picker.dismiss(animated: true, completion: nil)
        
        }
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }

    
}

