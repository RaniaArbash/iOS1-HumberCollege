//
//  ViewController.swift
//  Week4
//
//  Created by Rania Arbash on 2024-09-27.
//

import UIKit

class ViewController: UIViewController , 
                        UIPickerViewDelegate,
                        UIPickerViewDataSource,
                      UITableViewDelegate, UITableViewDataSource {
 
    
    @IBOutlet weak var stdTable: UITableView!
    
    
    
    var semesters = ["Fall","Winter","Summer"]
    var selectedSemesterIndex = 0
    
    @IBOutlet weak var stdNameText: UITextField!
    
    
    @IBOutlet weak var programText: UITextField!
    var stdarray = (UIApplication.shared.delegate as! AppDelegate).allStudents
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    
    
    @IBAction func saveClicked(_ sender: Any) {
        
        if let goodText = stdNameText.text , let goodProgram = programText.text {
            if !goodText.isEmpty , !goodProgram.isEmpty {
                
                let newStd = StudentModel(fullName: goodText, program: goodProgram, semester: semesters[selectedSemesterIndex])
                
                print(newStd.toString())
                (UIApplication.shared.delegate as! AppDelegate).allStudents.append(newStd)
                stdarray = (UIApplication.shared.delegate as! AppDelegate).allStudents
                
                stdTable.reloadData()
                stdNameText.text = ""
                programText.text = ""
            }
        }
        
        
        
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return semesters.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
                return semesters[row]
            
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
          selectedSemesterIndex = row
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stdarray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        var stdIndex = indexPath.row
        cell?.textLabel?.text = "\(stdarray[stdIndex].fullName)   \(stdarray[stdIndex].program)"
        cell?.detailTextLabel?.text = "\(stdarray[stdIndex].semester)"
       
        
        return cell!
        
    }
    
}

