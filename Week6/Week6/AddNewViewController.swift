//
//  AddNewViewController.swift
//  Week6
//
//  Created by Rania Arbash on 2024-10-11.
//

import UIKit

protocol AddNewContactDelegateProtocol {
    func saveNewContactdidFinishWithContact(newContact: Contact)
    func saveNewContactDidCanceled()
}

class AddNewViewController: UIViewController {
    
    var delegate : AddNewContactDelegateProtocol? 
    
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
                let newContact = Contact(name: goodName, email: goodemail, phoneNumber: goodPhone)
                delegate?.saveNewContactdidFinishWithContact(newContact: newContact)
                dismiss(animated: true)
                
            }
            
            
        }
    }
    
    
    @IBAction func CancelClicked(_ sender: Any) {
        let alert = UIAlertController(title: "Carefull!!!!", message: "Are you sure you want to cancel? ", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Yes", style: .destructive,handler: { action in
            self.delegate?.saveNewContactDidCanceled()
            self.dismiss(animated: true)
        }))
        
        alert.addAction(UIAlertAction(title: "No", style: .default))
//
       present(alert, animated: true)
//    
      
        
        
        

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
