//
//  AddNewViewController.swift
//  Week6
//
//  Created by Rania Arbash on 2024-10-11.
//

import UIKit

class AddNewViewController: UIViewController {

    
    @IBOutlet weak var nameText: UITextField!
    
    @IBOutlet weak var emailText: UITextField!
    
    
    @IBOutlet weak var phoneText: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func DoneClicked(_ sender: Any) {
        
        if let goodName = nameText.text , let goodemail = emailText.text, let goodPhone = phoneText.text {
            if !goodName.isEmpty , !goodemail.isEmpty, !goodPhone.isEmpty {
                var newContact = Contact(name: goodName, email: goodemail, phoneNumber: goodPhone)
                
                dismiss(animated: true)
                
            }
            
            
        }
    }
    
    
    @IBAction func CancelClicked(_ sender: Any) {
        
        dismiss(animated: true)

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
