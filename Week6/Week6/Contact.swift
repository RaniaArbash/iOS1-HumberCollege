//
//  Contact.swift
//  Week6
//
//  Created by Rania Arbash on 2024-10-11.
//

import Foundation


class Contact {
    
    var name : String = ""
    var email : String = ""
    var phoneNumber : String = ""
    
    init(name: String, email: String, phoneNumber: String) {
        self.name = name
        self.email = email
        self.phoneNumber = phoneNumber
    }
}


class ContactManager {
   public static var shared = ContactManager()
    
    var contactList : [Contact] = [Contact(name: "John", email: "John@hotmail.com", phoneNumber: "4166661111") , Contact(name: "Mary", email: "Mary@hotmail.com", phoneNumber: "4162228888") ]
   
    
    
    func addNewContact(c: Contact){
        contactList.append(c)
    }
    
    func deleteContact(cIndex : Int){
        contactList.remove(at: cIndex)
    }
    
    
    
    
}
