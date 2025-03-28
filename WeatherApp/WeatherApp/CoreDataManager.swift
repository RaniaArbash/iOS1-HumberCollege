//
//  CoreDataManager.swift
//  WeatherApp
//
//  Created by Rania Arbash on 2025-03-28.
//

import Foundation
import UIKit
import CoreData


class CoreDataManager {
    
    static var shared : CoreDataManager = CoreDataManager()
    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    // add new city
    
    func addNewCityToDB(name: String) {
    
        
        let newCity = City(context: context)
        newCity.id = UUID()
        newCity.cityName = name
        saveContext()
        
        
    }
    
    func deleteOneCityFromDB(cityToDelete: City) {
        context.delete(cityToDelete)
        saveContext()
        
    }
    
    func getAllCitiesFromDB() -> [City]{
        // select * from City
        // select * from City order by
       // select * from City where cityName beigens 't'
        var dblist = [City]()
        var fetchRequest =  City.fetchRequest()
        do {
            dblist = try  context.fetch(fetchRequest)
            // update ui
            
        }catch {
            print("error")
        }
        return dblist
    }
   
    func filterCitiesInDB (query : String){
       
       // select * from City order by cityName where cityName beigens 't'
     
        var fetchRequest =  City.fetchRequest()
        fetchRequest.sortDescriptors = [NSSortDescriptor.init(key: "cityName", ascending: true)]
        
      var predicate =  NSPredicate(format: "cityName BEGINS WITH [c] %@" ,query)
        fetchRequest.predicate = predicate
        
        do {
            var resutls = try  context.fetch(fetchRequest)
            // update ui
            
        }catch {
            print("error")
        }
        
    }
    
    // delete one city
    // fetch all cities
    // filter cities
    
    

    
    func saveContext () {
        let context = context
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
