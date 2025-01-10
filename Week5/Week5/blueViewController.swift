//
//  blueViewController.swift
//  Week5
//
//  Created by Rania Arbash on 2024-10-04.
//

import UIKit

class blueViewController: UIViewController ,
                          UIImagePickerControllerDelegate,
                          UINavigationControllerDelegate{

    @IBOutlet weak var textInBlueVC: UILabel!
    var nameFromWhiteVC: String = ""
    
    
    @IBOutlet weak var image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("View Did Load - BLue")
        textInBlueVC.text = "Welcome \(nameFromWhiteVC)"
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("View Will Apppear - BLue")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("View Will disApppear - BLue")
    }
 

    @IBAction func takeAPhoto(_ sender: Any) {
        
        let cameraController = UIImagePickerController()
        cameraController.sourceType =  UIImagePickerController.isSourceTypeAvailable(.camera) ? .camera: .photoLibrary
        cameraController.delegate = self
        cameraController.allowsEditing = false
        
        present(cameraController, animated: true)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
        
        var selectedImage = info[.originalImage] as! UIImage
        
        image.image = selectedImage
        dismiss(animated: true, completion: nil)
        
        
        
    }

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
