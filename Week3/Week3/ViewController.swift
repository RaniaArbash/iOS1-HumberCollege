//
//  ViewController.swift
//  Week3
//
//  Created by Rania Arbash on 2024-09-20.
//

import UIKit

class ViewController: UIViewController , UIPickerViewDataSource , UIPickerViewDelegate {
    
    
    var numbers = ["1","2","3","4","5"]
    var letters = ["a","b","c","d","e"]

    
    @IBOutlet weak var lettersPicker: UIPickerView!
    
    @IBOutlet weak var mytext: UILabel!
    
    
    @IBOutlet weak var numberPicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        numberPicker.dataSource = self
        numberPicker.delegate = self
        
        lettersPicker.delegate = self
        lettersPicker.dataSource = self
    }

   
    @IBAction func login(_ sender: UIButton) {
        
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 0 {
            return numbers.count // step 2
        }
        else {
            return letters.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? { // step 3
        if pickerView.tag == 0 {
            return numbers[row]
        }
        
        return letters[row]
        
            
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 0 {
            mytext.text = "Numbers Picker \(numbers[row])"
            letters.append(numbers[row])
            numbers.remove(at: row)
        }else if pickerView.tag == 1 {
            mytext.text = "Letters Picker \(letters[row])"
            numbers.append(letters[row])
            letters.remove(at: row)
        }
        numberPicker.reloadAllComponents()
        lettersPicker.reloadAllComponents()
        
        
    }
}

