//
//  MyFirstRedViewController.swift
//  Week2
//
//  Created by Rania Arbash on 2025-01-17.
//

import UIKit

class MyFirstRedViewController: UIViewController {

    @IBOutlet weak var UserNumber: UILabel!
    
    
    @IBOutlet weak var counterText: UILabel!
    
    
    
    // create an app with one label and two buttons
    // first button with +
    // second button with -
    // Update the text in the label after clicking on the counter
   
    
    @IBOutlet weak var MyTitle: UILabel!
    
    
    var counter = 0
    
    var course = "iOS1"
    override func viewDidLoad() {
        super.viewDidLoad()
        counterText.text = "\(counter)"
        UserNumber.text = ""
        counterText.font = UIFont(name: "", size: 40)
        MyTitle.text = "Welcome to \(course)"
        MyTitle.backgroundColor = UIColor.black
        
        }
    
    
    @IBAction func RandomAction(_ sender: Any) {
        if sender is UISlider {
            
            var size = CGFloat((sender as! UISlider).value)
            print(size)
            MyTitle.font = UIFont(name: "System", size: 100)
           //MyTitle.font = UIFont(name: "", size: size)
            
            
        }
        else if sender is UISwitch {
            self.view.backgroundColor = self.view.backgroundColor == UIColor.gray ? UIColor.white  : UIColor.gray
            
        }
        
    }
    
    
    
    @IBAction func addCounter(_ sender: Any) {
        
        counter += 1
        counterText.text = "\(counter)"
        
    }
    
    
    @IBAction func Subtruct(_ sender: Any) {
        
        counter -= 1
        counterText.text = "\(counter)"
        

    }
    
    
    
    @IBAction func ButtonCLicked(_ sender: Any) {
        course = course == "iOS1" ? "iOS2" : "iOS1"
        MyTitle.text = "Welcome to \(course)"
    }
    
    
    
 
    
    
    @IBAction func DigitClicked(_ sender: UIButton) {
        
        if let goodTitle = sender.titleLabel?.text! {
            print(goodTitle)
            
            
            UserNumber.text = String(describing: UserNumber.text!) + String(describing: goodTitle)
        }
        
    }
    
    
    
}
