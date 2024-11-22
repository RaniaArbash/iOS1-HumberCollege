//
//  CoreDataManager.swift
//  Week12CoreDate-ToDoApp
//
//  Created by Rania Arbash on 2024-11-22.
//

import Foundation
import CoreData

class CoreDataManager {
   
    // ToDo app ---> CURD
    // insert new ToDo
    // update a ToDo
    // select task where -----
    // delete a task
    
    static var shared = CoreDataManager()
    
    func getAllToDosFromDB() -> [ToDo]{
        
        var dataabseList = [ToDo]()
       // select * from ToDo
        var fetchRequest : NSFetchRequest<ToDo> = ToDo.fetchRequest()
       
        do{
            dataabseList =  try persistentContainer.viewContext.fetch(fetchRequest)
            print(dataabseList.count)
        
        } catch {
            
            print(error)
        }
        return dataabseList
    }
    
    
    
    func getTodoWithSpecificTask(searchTask: String) -> [ToDo]{
        // select * from ToDo where task CONTAINS searchTask
        var dataabseList = [ToDo]()
       
        var fetchRequest : NSFetchRequest<ToDo> = ToDo.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "task CONTAINS[c] %@", searchTask)
    
        fetchRequest.sortDescriptors = [
            NSSortDescriptor(key: "task", ascending: true),
            NSSortDescriptor(key: "isUrgent", ascending: false)
        ]
        do{
            dataabseList =  try persistentContainer.viewContext.fetch(fetchRequest)
            print(dataabseList.count)
        
        } catch {
            
            print(error)
        }
        return dataabseList
    }
    
    
    
    func addNewToDo(task: String, date: Date, isUrgent: Bool){
        
        var newTodo = ToDo(context: persistentContainer.viewContext)
        newTodo.id = Int16(Int.random(in: 0...10000))
        newTodo.date = date
        newTodo.task = task
        newTodo.isUrgent = isUrgent
        
        saveContext()
    }
    
    func updateToDo(todoToUpdate: ToDo, newTask: String, newUrgent: Bool, newDate: Date){
        
        todoToUpdate.date = newDate
        todoToUpdate.task = newTask
        todoToUpdate.isUrgent = newUrgent
        
        saveContext()
    }
    
    func deleteOneToDo(todelete:ToDo){
        persistentContainer.viewContext.delete(todelete)
        saveContext()
    }
    
    
    
    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
    
        let container = NSPersistentContainer(name: "Week12CoreDate_ToDoApp")
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
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

    
    
}
