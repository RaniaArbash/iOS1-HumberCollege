//
//  ContactsTableViewController.swift
//  Week6
//
//  Created by Rania Arbash on 2024-10-11.
//

import UIKit

class ContactsTableViewController: UITableViewController, AddNewContactDelegateProtocol {


   // var contactManager = UIApplication.shared.delegate as! AppDelegate
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
          }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  ContactManager.shared.contactList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ContactTableViewCell

        cell.nameText.text = ContactManager.shared.contactList[indexPath.row].name
        cell.phoneText?.text = ContactManager.shared.contactList[indexPath.row].phoneNumber
        cell.emailText.text = ContactManager.shared.contactList[indexPath.row].email
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "todetails"{
            var cvc = segue.destination as! ContactViewController
            cvc.selectedIndex = tableView.indexPathForSelectedRow!.row
        } else {
            var avc = segue.destination as! AddNewViewController
            avc.delegate = self
        }
        
    }

    
    func saveNewContactdidFinishWithContact(newContact: Contact) {
        ContactManager.shared.addNewContact(c: newContact)
        tableView.reloadData()
    }
    
    func saveNewContactDidCanceled() {
        
    }
    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
