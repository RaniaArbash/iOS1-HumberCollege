//
//  redViewController.swift
//  Week5
//
//  Created by Rania Arbash on 2024-10-04.
//

import UIKit

class redViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("View Did Load - Red")
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("View Will Apppear - Red")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("View Will disApppear - Red")
    }
 
    
    
    @IBAction func goBack(_ sender: Any) {
        dismiss(animated: true)
        
    }
    
    
    @IBAction func changeColorSwitch(_ sender: Any) {
        view.backgroundColor = UIColor(red: 1, green: 165/255, blue: 0, alpha: 1)
    }
    
    
    
    @IBAction func changeColorClicked(_ sender: Any) {
        
        let alert = UIAlertController(title: "Changeing Background Color", message: "Which Color Do You Want? ", preferredStyle: .actionSheet)
    
        alert.addAction(UIAlertAction(title: "Green", style: .default, handler: { action in
            self.view.backgroundColor = UIColor(red: 144/255, green: 238/255, blue: 144/255, alpha: 1)
        }))
        
        alert.addAction(UIAlertAction(title: "Yellow", style: .default, handler: { action in
            self.view.backgroundColor = UIColor(red: 1, green: 165/255, blue: 0, alpha: 1)
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        present(alert, animated: true)
        
        
        
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
