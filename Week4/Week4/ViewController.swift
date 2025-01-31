//
//  ViewController.swift
//  Week4
//
//  Created by Rania Arbash on 2025-01-31.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var collegeList = ["Seneca College", "Humber College", "Centennial College"]
    
    @IBOutlet weak var studentsTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        studentsTable.dataSource = self
        studentsTable.delegate = self
        // Do any additional setup after loading the view.
    }
    
    // 2
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    // 1
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    //3
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mycell")!
        
        cell.textLabel?.text = "Section: \(indexPath.section) - Row: \(indexPath.row)"
        
        return cell
    }
    
    
}

