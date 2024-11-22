//
//  AddToDoViewController.swift
//  Week12CoreDate-ToDoApp
//
//  Created by Rania Arbash on 2024-11-22.
//

import UIKit


protocol AddingNewTodoProtocol {
    func addingNewTaskDone(task: String, isurg: Bool, taskdate: Date )
    func addingNewTaskCanceled()
}


class AddToDoViewController: UIViewController {
    
    var delegate: AddingNewTodoProtocol?
    
    @IBOutlet weak var taskText: UITextField!
    
    @IBOutlet weak var isUrgentSwitch: UISwitch!
    
    @IBOutlet weak var todoDate: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    
    @IBAction func saveToDo(_ sender: Any) {
        
        if let goodtask = taskText.text {
            delegate?.addingNewTaskDone(task: goodtask, isurg: isUrgentSwitch.isOn, taskdate: todoDate.date)
            dismiss(animated: true)
        }
    }
    
    
    
    @IBAction func cancelToDo(_ sender: Any) {
        delegate?.addingNewTaskCanceled()
        dismiss(animated: true)
    }
    
    
    
}
