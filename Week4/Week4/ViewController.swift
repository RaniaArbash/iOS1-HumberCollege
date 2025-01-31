//
//  ViewController.swift
//  Week4
//
//  Created by Rania Arbash on 2025-01-31.
//

import UIKit

class ViewController: UIViewController,
                      UITableViewDelegate,
                      UITableViewDataSource,
                      UIPickerViewDelegate,
                        UIPickerViewDataSource
{
    
    
    
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var collegePicker: UIPickerView!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var selectedCollege = ""
    var iosclass : ProgrammingClassManager?
    
    var collegeList :[String] = ["Seneca College", "Humber College", "Centennial College"]
    
    @IBOutlet weak var studentsTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectedCollege = collegeList[0]
        iosclass = ((UIApplication.shared.delegate) as! AppDelegate).myModel
        
        studentsTable.dataSource = self
        studentsTable.delegate = self
        
        collegePicker.delegate = self
        collegePicker.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    
    // 2
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (iosclass?.listOfStudnets.count)!
    }
    
    // 1
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //3
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mycell")!
        if let goodstd = iosclass?.listOfStudnets[indexPath.row] {
            cell.textLabel?.text = "\(goodstd.name)"
            cell.detailTextLabel?.text = "\(goodstd.college)"
        }
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {



    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return collegeList[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return collegeList.count
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedCollege = collegeList[row]
    }
    
    @IBAction func insertNewStudent(_ sender: Any) {
        
        if let text = nameText.text{
            if  (!text.isEmpty) {
                if let goodName = nameText.text {
                    
                    //var y = getYea (datePicker.date)
                    var formatter = DateFormatter()
                    formatter.dateFormat = "yyyy"
                    let year : String = formatter.string(from: datePicker.date)
                    
                    if let intYear = Int(year){
                        
                        var newStudent = Student(name: goodName, college: selectedCollege, yearOfBirth:intYear )
                        iosclass?.addNewStudent(newStd: newStudent)
                        studentsTable.reloadData()
                        
                        nameText.text = ""
                        datePicker.setDate(Date(), animated: true)
                        
                    }
                }
            }
        }
            
            
        }
        
        
    }

