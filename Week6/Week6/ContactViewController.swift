//
//  ContactViewController.swift
//  Week6
//
//  Created by Rania Arbash on 2024-10-11.
//

import UIKit

class ContactViewController: UIViewController {

    @IBOutlet weak var nameText: UILabel!
    var selectedIndex : Int = 0
    @IBOutlet weak var phoneText: UILabel!
    
    @IBOutlet weak var emailText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameText.text = ContactManager.shared.contactList[selectedIndex].name
        emailText.text = ContactManager.shared.contactList[selectedIndex].email
        phoneText.text = ContactManager.shared.contactList[selectedIndex].phoneNumber
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
