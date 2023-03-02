//
//  Persistence.swift
//  CoreData_
//
//  Created by PaulmaX on 28.02.23.
//

import CoreData

struct PersistenceController {
    
    static let shared = PersistenceController()
    
    let container:  NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "CoreData_")
        container.viewContext.automaticallyMergesChangesFromParent = true
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
    }
}

/*
 ///temporary mock preview ⚠️
 static var preview: PersistenceController = {
 let result = PersistenceController(inMemory: true)
 let viewContext = result.container.viewContext
 for x in 0..<9 {
 let newFruit = Fruit(context: viewContext)
 newFruit.name = "Apple \(x + 1)"
 }
 do {
 try viewContext.save()
 } catch {
 let nsError = error as NSError
 fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
 }
 return result
 }()
 */
