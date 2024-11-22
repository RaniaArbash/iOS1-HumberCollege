//
//  AddToDoViewController.swift
//  Week12CoreDate-ToDoApp
//
//  Created by Rania Arbash on 2024-11-22.
//

import UIKit

class AddToDoViewController: UIViewController {
    
    
    @IBOutlet weak var taskText: UITextField!
    
    @IBOutlet weak var isUrgentSwitch: UISwitch!
    
    
    @IBOutlet weak var todoDate: UIDatePicker!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    
    
    @IBAction func saveToDo(_ sender: Any) {
    }
    
    
    
    @IBAction func cancelToDo(_ sender: Any) {
    }
    
    
    
}
