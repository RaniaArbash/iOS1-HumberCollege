//
//  ViewController.swift
//  Week5
//
//  Created by Rania Arbash on 2024-10-04.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var changeColor: UISwitch!
    
    @IBOutlet weak var nameText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("View Did Load - White")  
    }
    
    @IBAction func changeColorSwitch(_ sender: Any) {
        
        view.backgroundColor = UIColor(red: 1, green: 200/255, blue: 0, alpha: 1)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        print("View Will Apppear - White")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("View Will disApppear - White")
    }
    
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "tored"{
                
        }else {
            
            let blueVC =  segue.destination as! blueViewController
            if let goodName = nameText.text {
                blueVC.nameFromWhiteVC = goodName
            }
        }
    }
    


}

