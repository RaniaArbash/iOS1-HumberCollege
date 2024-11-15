//
//  CitiesTableViewController.swift
//  WeatherApp
//
//  Created by Rania Arbash on 2024-11-08.
//

import UIKit

class CitiesTableViewController: UITableViewController, UISearchBarDelegate, NetworkingDelegate {
   


    @IBOutlet weak var searchBar: UISearchBar!
    
    var apiCities = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        searchBar.delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        NetworkingManager.shared.delegate = self

    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String){
        
        print(searchText)
        if searchText.count > 2{
           
            NetworkingManager.shared.getCitiesFromAPI(city: searchText) { result in
                switch result {
                case .failure(let error):
                    print(error)
                    
                case .success(let list):
                    self.apiCities = list
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                
                }
                
            }
        }
        else {
            apiCities = [String]()
            tableView.reloadData()
            
        }
    }
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return apiCities.count
    }
    
    func networkingDidFinishWithListOfCities(cities: [String]) {
        apiCities = cities
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        
    }
    
    func networkingDidFail() {
        
    }
    
    func networkingDidFinishWithWeatherObj(wo: WeatherModel) {
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        cell.textLabel?.text = apiCities[indexPath.row]

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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
       
        var weatherVC = segue.destination as! WeatherViewController
        var i = tableView.indexPathForSelectedRow?.row
        weatherVC.selectedCity = apiCities[i!]
        
    }
    

}
