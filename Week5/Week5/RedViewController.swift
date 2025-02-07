//
//  RedViewController.swift
//  Week5
//
//  Created by Rania Arbash on 2025-02-07.
//

import UIKit

class RedViewController: UIViewController {

    
    var userName : String = ""
    
    @IBOutlet weak var redLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Red View - In View Did Load")
        redLabel.text = "Welcome \(userName)"
        // Do any additional setup after loading the view.
    }
    

    
    override func viewWillAppear(_ animated: Bool) {
        print("Red View - In View Will Appear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("Red View - In View Did Appear")
    }
    override func viewWillDisappear(_ animated: Bool) {
        print("Red View - In View Will DisAppear")

    }

    
    @IBAction func changeBg(_ sender: Any) {
        
        self.view.backgroundColor = UIColor(_colorLiteralRed: 255, green: 128, blue: 0, alpha: 1)
        
    }
    
    
    override func viewDidDisappear(_ animated: Bool) {
        print("Red View - In View Did DisAppear")
    }

    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
