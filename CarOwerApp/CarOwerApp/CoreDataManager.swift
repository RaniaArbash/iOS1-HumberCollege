//
//  CoreDataManager.swift
//  CarOwerApp
//
//  Created by Rania Arbash on 2024-11-29.
//

import Foundation
import CoreData


class CoreDataManager {
    
    static var shared = CoreDataManager()
    
    func addNewOwner(id: Int, name: String, yob: Int){
        var newOwner = Owner(context: persistentContainer.viewContext)
        newOwner.id = Int16(id)
        newOwner.name = name
        newOwner.yob = Int32(yob)

        saveContext()
    }
    
    
    func getAllOwners()->[Owner]{
        
        var listOfDBOwners = [Owner]()
        // select * from Owner where name contains 'Rania' orderBy
        let fetchRequest = Owner.fetchRequest()
      //  fetchRequest.predicate = NSPredicate(format: "yob == %d", 1990)
       // var sorting = NSSortDescriptor(key: "name", ascending: true)
        //fetchRequest.sortDescriptors = [sorting]
        do{
            listOfDBOwners =  try persistentContainer.viewContext.fetch(fetchRequest)
            
        }catch {
            print(error)
        }
        
        return listOfDBOwners
    }
    
    func getAllCars()->[Car]{
        
        var listOfDBCars = [Car]()
        let fetchRequest = Car.fetchRequest()
          do{
            listOfDBCars =  try persistentContainer.viewContext.fetch(fetchRequest)
            
              for DBCar in listOfDBCars {
                  print(DBCar.ownedBy?.name)
                  print(DBCar.model)
                  print(DBCar.year)
              }
             

        }catch {
            print(error)
        }
        
        return listOfDBCars
    }
  
    
    
    func deleteAllCars(){
        var dbcars = getAllCars()
        for car in dbcars {
            persistentContainer.viewContext.delete(car)
        }
        saveContext()
    }
    
    
    func deleteOneCarForOwner(owner: Owner, cartodelete: Car){
        
        let fetchRequest = Owner.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %d", owner.id)
        do{
            var fetchedOwner =  try persistentContainer.viewContext.fetch(fetchRequest)
           
            var cars = fetchedOwner[0].ownes!.allObjects as! [Car]
            cars.removeAll { car in
                car.id == cartodelete.id
            }
            
            persistentContainer.viewContext.delete(cartodelete)
            
            saveContext()
            
        }catch {
            print(error)
        }
        
    }
    
    func getAllCarsForOneOwner(owner: Owner)-> [Car]{
        
        var cars = [Car]()
        let fetchRequest = Owner.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %d", owner.id)
        do{
            var fetchedOwner =  try persistentContainer.viewContext.fetch(fetchRequest)
            cars = fetchedOwner[0].ownes!.allObjects as! [Car]
            
        }catch {
            print(error)
        }
        
            return cars
    }

    func addCarToOwner(cid: Int, mod: String, year: Int, owner: Owner){
        
        var newCar = Car(context: persistentContainer.viewContext)
        newCar.id = Int16(cid)
        newCar.model = mod
        newCar.year = Int32(year)
        newCar.ownedBy = owner
    
        owner.ownes?.adding(newCar)
        
        saveContext()
    }
    
    
   
    
    
    
    lazy var persistentContainer: NSPersistentContainer = {
       
        let container = NSPersistentContainer(name: "CarOwerApp")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
               
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

    
    
}
