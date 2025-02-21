//
//  StudentListTableViewController.swift
//  week6
//
//  Created by Rania Arbash on 2025-02-14.
//

import UIKit

class StudentListTableViewController: UITableViewController , AddingNewStudentDelegate{
  

    var model: StudentManager?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        model = ((UIApplication.shared.delegate) as! AppDelegate).myModel
        //tableView.reloadData()
        
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func viewWillAppear(_ animated: Bool) {
       // model = ((UIApplication.shared.delegate) as! AppDelegate).myModel
        tableView.reloadData()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (model?.studentsList.count)!
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! StudentTableViewCell
        
        cell.studentImage.image = UIImage(data: (model?.studentsList[indexPath.row].imageData!)!)
        cell.studentName.text = model?.studentsList[indexPath.row].name
        cell.studentEmail.text =  model?.studentsList[indexPath.row].email
        
    
        return cell
    }

    
    func addingNewStudentDidFinishWithStudnetObject(newStudent: Student) {
        model?.addNewStudent(newStd: newStudent)
        tableView.reloadData()
    }
    
    func addingNewStudentDidCancel() {
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return 100
    }


    
    
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }



    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
                // delete from the datasource
            model?.deleteOneStudent(idtodelete: (model?.studentsList[indexPath.row].id)!)
            tableView.reloadData()
        }
    }
 

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
       var addingVC =  segue.destination as! ViewController
        addingVC.delegate = self
        
    }
    

}
