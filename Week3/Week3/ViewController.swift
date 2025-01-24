//
//  ViewController.swift
//  Week3
//
//  Created by Rania Arbash on 2025-01-24.
//

import UIKit

class ViewController: UIViewController , UIPickerViewDelegate, UIPickerViewDataSource{
    
    var myInt = 9
   
    
    
    
    @IBOutlet weak var myFirstPickerView: UIPickerView!
    
    var studentMangerModel : StudentManeger?
    
    @IBOutlet weak var myLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myFirstPickerView.delegate = self
        myFirstPickerView.dataSource = self
        
        studentMangerModel = (UIApplication.shared.delegate as! AppDelegate).myModel
        
        if let count = studentMangerModel?.allStudents.count , let name = studentMangerModel?.allStudents[0].name {
            print(count )
            print(name)
        }
            

    }
    
    func updateMyInt(){
        myInt  += 10
    }
    
    
    @IBAction func clickMe(_ sender: Any) {
    }
    
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 4
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 10
    }

    func pickerView(_ pickerView: UIPickerView, 
                    titleForRow row: Int,
                    forComponent component: Int) -> String? {
        
        if component == 0 {
            return "iOS1"
        }else if component == 1 {
            return "iOS2"
        }
        else if component == 2 {
            return "Swift"
        }
        
        return "Humber"
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
