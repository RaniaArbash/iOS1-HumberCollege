//
//  ViewController.swift
//  Week2Project
//
//  Created by Rania Arbash on 2024-09-13.
//

import UIKit

class ViewController: UIViewController {

    var counter = 0
    @IBOutlet weak var countertext: UILabel!
    
    
    @IBOutlet weak var increasBUtton: UIButton!
    
    
    @IBOutlet weak var num1text: UITextField!
    
    @IBOutlet weak var num2text: UITextField!
    
    
    @IBOutlet weak var countersubBut: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countertext.textColor = UIColor.green
        
        increasBUtton.setTitle("Add 1", for: .normal)
        countersubBut.setTitle("Sub 1", for: .normal)
        
    }
    
    
    @IBAction func addOne(_ sender: Any) {
        
        counter += 1
        countertext.text = "\(counter)"
    }
    
    
    @IBAction func SubOne(_ sender: Any) {
        
        
        counter -= 1
        countertext.text = "\(counter)"
    }
    
   
    
    @IBAction func test(_ sender: Any) {
        if sender is UIButton {
            var but = sender as! UIButton
            
        }
        
        
    }
    
    
    @IBAction func Add(_ sender: UIButton) {
        if let num1 = num1text.text , let num2 = num2text.text {
            if !num1.isEmpty , !num2.isEmpty {
                // the two texts are not null
                // the two texts are not empty
                var result = 0
                
                if sender.titleLabel?.text == "+" {

                     result = Int(num1)! + Int(num2)!
                }
                else if sender.titleLabel?.text == "-" {
                    result = Int(num1)! - Int(num2)!
                }
                
                countertext.text = "\(result)"
            }
            
            
        }
        
        
    }
    
    
    @IBAction func Sub(_ sender: UIButton) {
        
        
    }
    

}

