//
//  ViewController.swift
//  week6
//
//  Created by Rania Arbash on 2025-02-14.
//

import UIKit

class ViewController: UIViewController ,
                        UIImagePickerControllerDelegate,
                      UINavigationControllerDelegate {

    
    @IBOutlet weak var nameText: UITextField!
    
    @IBOutlet weak var emailText: UITextField!
    
    
    @IBOutlet weak var userImage: UIImageView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func uploadPhotoClicked(_ sender: Any) {
        
        let c = UIImagePickerController()
        c.sourceType = UIImagePickerController.isSourceTypeAvailable(.camera) ? .camera:.photoLibrary
        c.delegate = self
        c.allowsEditing = false
        
        
        present(c, animated: true)
        
        
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, 
                               didFinishPickingMediaWithInfo info:
    [UIImagePickerController.InfoKey : Any]){
        print("image selected")
        
        let selectedImage = info[.originalImage] as? UIImage
        userImage.image = selectedImage
        dismiss(animated: true, completion: nil)
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController){
        print("picker canceled")
        dismiss(animated: true, completion: nil)
        
    }
    

}

