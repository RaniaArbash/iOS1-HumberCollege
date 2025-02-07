//
//  GreenViewController.swift
//  Week5
//
//  Created by Rania Arbash on 2025-02-07.
//

import UIKit

class GreenViewController: UIViewController {

    
    @IBOutlet weak var progresaV: UIProgressView!
    
    @IBOutlet weak var selectedValue: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectedValue.text = "\(progresaV.progress)"
        // Do any additional setup after loading the view.
    }
    
    
    
    
    
    
    @IBAction func cloaseVC(_ sender: Any) {
        
        var valueToPass = progresaV.progress
      dismiss(animated: true)
        
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
