//
//  ViewController.swift
//  CarOwerApp
//
//  Created by Rania Arbash on 2024-11-29.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        CoreDataManager.shared.addNewOwner(id: 2, name: "John Lee", yob: 1980)
//        CoreDataManager.shared.addNewOwner(id: 3, name: "Mary Smith", yob: 2000)
//        CoreDataManager.shared.addNewOwner(id: 4, name: "Sam Ken", yob: 1988)

        var dblist = CoreDataManager.shared.getAllOwners()
        print(dblist[0].name)
        print(dblist[1].name)
        print(dblist[2].name)

//        
//        CoreDataManager.shared.deleteAllCars()
//        var allcars = CoreDataManager.shared.getAllCars()
//        print(allcars.count)
        
        
//        CoreDataManager.shared.addCarToOwner(cid: 1, mod: "Mazda", year: 2000, owner: dblist[2])
//        CoreDataManager.shared.addCarToOwner(cid: 2, mod: "Nissan", year: 2016, owner: dblist[2])
//        CoreDataManager.shared.addCarToOwner(cid: 2, mod: "Kia", year: 2012, owner: dblist[2])
//        
    //    var allcars = CoreDataManager.shared.getAllCars()
        
    var carsForMary =  CoreDataManager.shared.getAllCarsForOneOwner(owner: dblist[1])
    print(carsForMary.count)
        print("Mary's cars ")
        for car in carsForMary {
            print("\(car.model) - \(car.year)")
        }
        
        var carsForSam =  CoreDataManager.shared.getAllCarsForOneOwner(owner: dblist[2])
        print(carsForSam.count)
        print("Sam's cars ")
        for car in carsForSam {
            
            print("\(car.model) - \(car.year)")
        }
        
        CoreDataManager.shared.deleteOneCarForOwner(owner: dblist[2], cartodelete: carsForSam[0])

        
        carsForSam =  CoreDataManager.shared.getAllCarsForOneOwner(owner: dblist[2])
        print(carsForSam.count)
        print("Sam's cars ")
        for car in carsForSam {
            print("\(car.model) - \(car.year)")
        }

    }


}

