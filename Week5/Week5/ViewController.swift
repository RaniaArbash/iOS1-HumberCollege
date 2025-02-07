//
//  ViewController.swift
//  Week5
//
//  Created by Rania Arbash on 2025-02-07.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("White View - In View Did Load")
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("White View - In View Will Appear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("White View - In View Did Appear")
    }
    override func viewWillDisappear(_ animated: Bool) {
        print("White View - In View Will DisAppear")

    }

    override func viewDidDisappear(_ animated: Bool) {
        print("White View - In View Did DisAppear")
    }

    @IBAction func changeColor(_ sender: Any) {
        
        self.view.backgroundColor = UIColor(_colorLiteralRed: 0, green: 128, blue: 255, alpha: 1)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "red"){
            
            var redVC =  segue.destination as! RedViewController
            
            if let userInput = nameText.text , !userInput.isEmpty {
                
                redVC.userName = userInput
                
            }
        }
        
    }
    
    
    
    
}

