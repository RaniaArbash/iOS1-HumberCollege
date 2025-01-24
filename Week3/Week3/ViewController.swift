//
//  ViewController.swift
//  Week3
//
//  Created by Rania Arbash on 2025-01-24.
//

import UIKit

class ViewController: UIViewController , UIPickerViewDelegate, UIPickerViewDataSource{
    
    var myInt = 9
   
    var letters = ["a","b","c","d","e","f"]
    var colleges = ["Humber College", "Seneca College","Centennial College"]
    
    var numbers = ["1","2","3","4","5","6"]
    
    // display the component number and the row number in myLable after clicking on any row/component
    
    
    @IBOutlet weak var myFirstPickerView: UIPickerView!
    
    
    @IBOutlet weak var mySecondPickerView: UIPickerView!
    
    
    var studentMangerModel : StudentManeger?
    
    @IBOutlet weak var myLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myFirstPickerView.delegate = self
        myFirstPickerView.dataSource = self
        myFirstPickerView.tag = 1
        
        mySecondPickerView.delegate = self
        mySecondPickerView.dataSource = self
        mySecondPickerView.tag = 2
        
        
        studentMangerModel = (UIApplication.shared.delegate as! AppDelegate).myModel
        
        if let count = studentMangerModel?.allStudents.count , let name = studentMangerModel?.allStudents[0].name {
            print(count )
            print(name)
        }
            

    }
    
    
    @IBAction func updateBothPickers(_ sender: Any) {
    
        letters.append("g")
        numbers.append("7")
        myFirstPickerView.reloadAllComponents()
        mySecondPickerView.reloadAllComponents()
        
        
    }
    
    func updateMyInt(){
        myInt  += 10
    }
    
    
    @IBAction func clickMe(_ sender: Any) {
    }
    
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 1{
            return numbers.count
        }
        else {
            return letters.count
        }
    }

    func pickerView(_ pickerView: UIPickerView, 
                    titleForRow row: Int,
                    forComponent component: Int) -> String? {
        if pickerView.tag == 1{
            return numbers[row]
        }
        else {
            return letters[row]
        }
        
      
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        if pickerView.tag == 1 { // 5 ==> remove 5 from numbers and add it to letters
            letters.append(numbers[row])
            numbers.remove(at: row)
        }
        else {
            numbers.append(letters[row])
            letters.remove(at: row)
        }
        myFirstPickerView.reloadAllComponents()
        mySecondPickerView.reloadAllComponents()
    }

    
    
    
}

//
//extension ViewController : UIPickerViewDelegate, UIPickerViewDataSource{
//    
//    func numberOfComponents(in pickerView: UIPickerView) -> Int {
//        return 4
//    }
//    
//    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        return 10
//    }
//}
