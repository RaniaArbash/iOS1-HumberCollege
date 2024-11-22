//
//  ToDoTableViewController.swift
//  Week12CoreDate-ToDoApp
//
//  Created by Rania Arbash on 2024-11-22.
//

import UIKit

class ToDoTableViewController: UITableViewController , AddingNewTodoProtocol, UISearchBarDelegate
{
    var dbtasks = [ToDo]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        dbtasks = CoreDataManager.shared.getAllToDosFromDB()

        tableView.reloadData()
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        dbtasks = CoreDataManager.shared.getTodoWithSpecificTask(searchTask: searchBar.text!)
        tableView.reloadData()
    
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            dbtasks = CoreDataManager.shared.getAllToDosFromDB()
            tableView.reloadData()
        }
    }
    
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dbtasks.count
    }

    
    
    
    func addingNewTaskDone(task: String, isurg: Bool, taskdate: Date) {
        CoreDataManager.shared.addNewToDo(task: task, date: taskdate, isUrgent: isurg)
    }
    
    func addingNewTaskCanceled() {
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        cell.textLabel?.text = dbtasks[indexPath.row].task
        cell.detailTextLabel?.text = dbtasks[indexPath.row].date?.description

        cell.backgroundColor =  dbtasks[indexPath.row].isUrgent ? UIColor.red: UIColor.green
        
        return cell
    }
    

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }


    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            CoreDataManager.shared.deleteOneToDo(todelete: dbtasks[indexPath.row])
            dbtasks = CoreDataManager.shared.getAllToDosFromDB()
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
    
        var addVC = segue.destination as! AddToDoViewController
        addVC.delegate = self
    }
    

}
