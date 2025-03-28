//
//  FavCitiesTable.swift
//  WeatherApp
//
//  Created by Rania Arbash on 2025-03-28.
//

import UIKit

class FavCitiesTable: UITableViewController {

    var dblist = [City] ()
    override func viewDidLoad() {
        super.viewDidLoad()
        dblist =  CoreDataManager.shared.getAllCitiesFromDB()
        print(dblist.count)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dblist.count
    }

    override func viewWillAppear(_ animated: Bool) {
        dblist =  CoreDataManager.shared.getAllCitiesFromDB()
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        cell.textLabel?.text = dblist[indexPath.row].cityName
        
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        if segue.identifier == "toweather"{
            var WVC =   segue.destination as! WeatherViewController
            WVC.selectedCity =  dblist[(tableView.indexPathForSelectedRow?.row)!].cityName
        }
        


    }

 
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            CoreDataManager.shared.deleteOneCityFromDB(cityToDelete: dblist[indexPath.row])
            dblist =  CoreDataManager.shared.getAllCitiesFromDB()
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
